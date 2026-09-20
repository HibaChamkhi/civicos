/// Subject area of a lesson.
enum LessonTopic {
  environment,
  firstAid,
  civic,
  digital,
  sustainability,
  money,
}

/// A short lesson with a quiz at the end.
class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.summary,
    required this.topic,
    required this.minutes,
    required this.xpReward,
    required this.questionCount,
    required this.progress,
  });

  final String id;
  final String title;
  final String summary;
  final LessonTopic topic;
  final int minutes;
  final int xpReward;
  final int questionCount;

  /// 0 to 1. 1 means the quiz was passed.
  final double progress;

  bool get isStarted => progress > 0;

  bool get isComplete => progress >= 1;
}
