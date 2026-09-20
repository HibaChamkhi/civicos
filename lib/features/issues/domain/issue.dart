/// What kind of problem was reported.
enum IssueCategory {
  lighting,
  waste,
  road,
  water,
  accessibility,
  safety,
  publicSpace,
  other,
}

/// How quickly it needs attention.
enum IssueUrgency { low, medium, high }

/// The issue lifecycle. [step] is the 1-based position shown in the status
/// badge; declined issues sit outside the lifecycle.
enum IssueStatus {
  reported(1),
  underReview(2),
  accepted(3),
  assigned(4),
  inProgress(5),
  resolved(6),
  declined(null);

  const IssueStatus(this.step);

  final int? step;

  static const int totalSteps = 6;

  bool get isOpen =>
      this != IssueStatus.resolved && this != IssueStatus.declined;
}

/// A civic issue reported by a neighbor.
class Issue {
  const Issue({
    required this.id,
    required this.title,
    required this.summary,
    required this.category,
    required this.status,
    required this.urgency,
    required this.placeName,
    required this.distanceMeters,
    required this.reportedAt,
    required this.supporters,
    this.reporterName,
  });

  final String id;
  final String title;
  final String summary;
  final IssueCategory category;
  final IssueStatus status;
  final IssueUrgency urgency;

  /// Street or landmark, never a precise address of a person.
  final String placeName;
  final int distanceMeters;
  final DateTime reportedAt;
  final int supporters;

  /// `null` when the reporter chose to stay anonymous.
  final String? reporterName;
}
