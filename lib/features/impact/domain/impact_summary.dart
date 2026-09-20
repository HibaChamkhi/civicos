/// A badge, earned or still locked. Named to avoid clashing with
/// Material's own `Badge` widget.
class ImpactBadge {
  const ImpactBadge({
    required this.id,
    required this.name,
    required this.description,
    this.earnedAt,
  });

  final String id;
  final String name;
  final String description;

  /// `null` while the badge is still locked.
  final DateTime? earnedAt;

  bool get isEarned => earnedAt != null;
}

/// Hours contributed on one day, used by the weekly chart.
class DailyContribution {
  const DailyContribution({required this.day, required this.hours});

  final DateTime day;
  final double hours;
}

/// Everything shown on the impact dashboard. Totals come from the server's
/// impact ledger, never from counting rows on the device.
class ImpactSummary {
  const ImpactSummary({
    required this.levelNumber,
    required this.levelName,
    required this.xp,
    required this.xpForNextLevel,
    required this.hoursThisWeek,
    required this.totalHours,
    required this.issuesReported,
    required this.issuesResolved,
    required this.peopleHelped,
    required this.missionsCompleted,
    required this.eventsAttended,
    required this.badges,
    required this.week,
  });

  final int levelNumber;
  final String levelName;
  final int xp;
  final int xpForNextLevel;
  final double hoursThisWeek;
  final double totalHours;
  final int issuesReported;
  final int issuesResolved;
  final int peopleHelped;
  final int missionsCompleted;
  final int eventsAttended;
  final List<ImpactBadge> badges;

  /// The last seven days, oldest first.
  final List<DailyContribution> week;

  /// 0 to 1 toward the next level.
  double get levelProgress =>
      xpForNextLevel == 0 ? 0 : (xp / xpForNextLevel).clamp(0, 1);

  int get xpToNextLevel => (xpForNextLevel - xp).clamp(0, xpForNextLevel);

  List<ImpactBadge> get earnedBadges =>
      badges.where((badge) => badge.isEarned).toList();
}
