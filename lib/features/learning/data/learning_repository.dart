import 'package:civicos/core/preferences/app_locale.dart';
import 'package:civicos/core/sample/sample_data.dart';
import 'package:civicos/features/learning/domain/lesson.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'learning_repository.g.dart';

/// Reads lessons and how far the person has got with them.
abstract interface class LearningRepository {
  Future<List<Lesson>> lessons();
}

class SampleLearningRepository implements LearningRepository {
  const SampleLearningRepository({this.arabic = false});

  /// Sample content ships in both languages; the server will return
  /// whatever language a neighbor wrote.
  final bool arabic;

  @override
  Future<List<Lesson>> lessons() async {
    await Future<void>.delayed(SampleData.latency);
    return SampleData.lessons(arabic: arabic);
  }
}

@Riverpod(keepAlive: true)
LearningRepository learningRepository(Ref ref) =>
    SampleLearningRepository(arabic: ref.watch(isArabicProvider));

@riverpod
Future<List<Lesson>> lessons(Ref ref) =>
    ref.watch(learningRepositoryProvider).lessons();

/// The lesson to offer next: the one in progress, else the first unstarted.
@riverpod
Future<Lesson?> lessonToContinue(Ref ref) async {
  final all = await ref.watch(lessonsProvider.future);
  for (final lesson in all) {
    if (lesson.isStarted && !lesson.isComplete) return lesson;
  }
  for (final lesson in all) {
    if (!lesson.isStarted) return lesson;
  }
  return null;
}
