import 'package:civicos/core/preferences/app_locale.dart';
import 'package:civicos/core/sample/sample_data.dart';
import 'package:civicos/features/events/domain/community_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'events_repository.g.dart';

/// Reads community events.
abstract interface class EventsRepository {
  /// Events that haven't happened yet, soonest first.
  Future<List<CommunityEvent>> upcoming({int limit});
}

class SampleEventsRepository implements EventsRepository {
  const SampleEventsRepository({this.arabic = false});

  /// Sample content ships in both languages; the server will return
  /// whatever language a neighbor wrote.
  final bool arabic;

  @override
  Future<List<CommunityEvent>> upcoming({int limit = 20}) async {
    await Future<void>.delayed(SampleData.latency);
    final now = DateTime.now();
    final events =
        SampleData.events(
            arabic: arabic,
          ).where((event) => event.startsAt.isAfter(now)).toList()
          ..sort((a, b) => a.startsAt.compareTo(b.startsAt));
    return events.take(limit).toList();
  }
}

@Riverpod(keepAlive: true)
EventsRepository eventsRepository(Ref ref) =>
    SampleEventsRepository(arabic: ref.watch(isArabicProvider));

@riverpod
Future<List<CommunityEvent>> upcomingEvents(Ref ref) =>
    ref.watch(eventsRepositoryProvider).upcoming();
