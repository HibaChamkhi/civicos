import 'package:civicos/features/community/data/feed_repository.dart';
import 'package:civicos/features/events/data/events_repository.dart';
import 'package:civicos/features/impact/data/impact_repository.dart';
import 'package:civicos/features/issues/data/issues_repository.dart';
import 'package:civicos/features/learning/data/learning_repository.dart';
import 'package:civicos/features/learning/domain/lesson.dart';
import 'package:civicos/features/missions/data/missions_repository.dart';
import 'package:civicos/features/volunteering/data/opportunities_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('issues', () {
    const repository = SampleIssuesRepository();

    test('returns the closest first', () async {
      final issues = await repository.nearby();
      final distances = issues.map((i) => i.distanceMeters).toList();
      expect(distances, orderedEquals([...distances]..sort()));
    });

    test('honours the limit', () async {
      expect(await repository.nearby(limit: 2), hasLength(2));
    });

    test('finds an issue by id, and nothing for an unknown one', () async {
      final issues = await repository.nearby();
      final first = issues.first;
      expect((await repository.byId(first.id))?.title, first.title);
      expect(await repository.byId('nope'), isNull);
    });
  });

  group('opportunities', () {
    const repository = SampleOpportunitiesRepository();

    test('matches strongest first and hides full ones', () async {
      final matched = await repository.matched();
      final scores = matched.map((o) => o.matchScore).toList();
      final strongestFirst = [...scores]..sort((a, b) => b.compareTo(a));
      expect(scores, orderedEquals(strongestFirst));
      expect(matched.where((o) => o.isFull), isEmpty);
    });

    test(
      'the full list is ordered by start time and keeps full ones',
      () async {
        final all = await repository.all();
        final starts = all.map((o) => o.startsAt).toList();
        final soonestFirst = [...starts]..sort((a, b) => a.compareTo(b));
        expect(starts, orderedEquals(soonestFirst));
        expect(all.where((o) => o.isFull), isNotEmpty);
      },
    );

    test('spots left never goes negative', () async {
      for (final opportunity in await repository.all()) {
        expect(opportunity.spotsLeft, greaterThanOrEqualTo(0));
      }
    });
  });

  group('events', () {
    test('only upcoming events, soonest first', () async {
      final events = await const SampleEventsRepository().upcoming();
      expect(events, isNotEmpty);
      for (final event in events) {
        expect(event.startsAt.isAfter(DateTime.now()), isTrue);
      }
      final starts = events.map((e) => e.startsAt).toList();
      final soonestFirst = [...starts]..sort((a, b) => a.compareTo(b));
      expect(starts, orderedEquals(soonestFirst));
    });
  });

  group('missions', () {
    test('the ones you joined come first', () async {
      final missions = await const SampleMissionsRepository().active();
      final firstNotJoined = missions.indexWhere((m) => !m.joined);
      final lastJoined = missions.lastIndexWhere((m) => m.joined);
      expect(lastJoined, lessThan(firstNotJoined));
    });

    test('progress counts partial objectives', () async {
      final missions = await const SampleMissionsRepository().active();
      final clean = missions.firstWhere((m) => m.title == 'Clean Streets');
      // Done 1/1, 0/1 and 1/2 → (1 + 0 + 0.5) / 3.
      expect(clean.progress, closeTo(0.5, 0.001));
      expect(clean.tasksDone, 1);
      expect(clean.isComplete, isFalse);
    });
  });

  group('learning', () {
    const repository = SampleLearningRepository();

    test('offers the lesson already in progress first', () async {
      final next = await _nextLesson(repository);
      expect(next?.title, 'First aid: the first three minutes');
    });

    test('lessons carry progress and rewards', () async {
      final lessons = await repository.lessons();
      expect(lessons, isNotEmpty);
      expect(lessons.where((l) => l.isComplete), isNotEmpty);
      for (final lesson in lessons) {
        expect(lesson.progress, inInclusiveRange(0, 1));
        expect(lesson.xpReward, greaterThan(0));
      }
    });
  });

  group('impact', () {
    const repository = SampleImpactRepository();

    test('the week has seven days, oldest first', () async {
      final summary = await repository.summary();
      expect(summary.week, hasLength(7));
      final days = summary.week.map((d) => d.day).toList();
      final oldestFirst = [...days]..sort((a, b) => a.compareTo(b));
      expect(days, orderedEquals(oldestFirst));
    });

    test('level progress stays between 0 and 1', () async {
      final summary = await repository.summary();
      expect(summary.levelProgress, inInclusiveRange(0, 1));
      expect(summary.xpToNextLevel, greaterThan(0));
    });

    test('locked badges are not counted as earned', () async {
      final summary = await repository.summary();
      expect(
        summary.earnedBadges.length,
        lessThan(summary.badges.length),
      );
    });

    test('the profile is placed at neighborhood level only', () async {
      final profile = await repository.profile();
      expect(profile.neighborhood, isNotEmpty);
      expect(profile.firstName, 'Amine');
    });
  });

  group('feed', () {
    test('newest first', () async {
      final items = await const SampleFeedRepository().latest();
      final times = items.map((i) => i.happenedAt).toList();
      final newestFirst = [...times]..sort((a, b) => b.compareTo(a));
      expect(times, orderedEquals(newestFirst));
    });
  });
}

/// Mirrors `lessonToContinue`: the started-but-unfinished lesson wins.
Future<Lesson?> _nextLesson(SampleLearningRepository repository) async {
  final lessons = await repository.lessons();
  for (final lesson in lessons) {
    if (lesson.isStarted && !lesson.isComplete) return lesson;
  }
  return null;
}
