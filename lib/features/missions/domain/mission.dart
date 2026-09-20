/// One objective inside a mission, e.g. "Report 1 illegal dumping spot".
class MissionTask {
  const MissionTask({
    required this.label,
    required this.target,
    required this.completed,
  });

  final String label;
  final int target;

  /// How many of [target] are done and verified.
  final int completed;

  bool get isDone => completed >= target;
}

/// A community mission: real-world objectives with an XP reward.
class Mission {
  const Mission({
    required this.id,
    required this.title,
    required this.summary,
    required this.tasks,
    required this.xpReward,
    required this.participants,
    required this.endsAt,
    required this.joined,
  });

  final String id;
  final String title;
  final String summary;
  final List<MissionTask> tasks;
  final int xpReward;
  final int participants;
  final DateTime endsAt;

  /// Whether the person has joined this mission.
  final bool joined;

  int get tasksDone => tasks.where((task) => task.isDone).length;

  /// 0 to 1 across all objectives, counting partial progress on each.
  double get progress {
    if (tasks.isEmpty) return 0;
    final total = tasks.fold<double>(
      0,
      (sum, task) => sum + (task.completed / task.target).clamp(0, 1),
    );
    return total / tasks.length;
  }

  bool get isComplete => tasks.every((task) => task.isDone);
}
