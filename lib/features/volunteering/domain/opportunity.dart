/// The kind of impact an opportunity has.
enum ImpactCategory { environment, education, social, health, digital }

/// How much experience an opportunity asks for.
enum Difficulty { beginner, intermediate, advanced }

/// A volunteering opportunity published by an organization.
class Opportunity {
  const Opportunity({
    required this.id,
    required this.title,
    required this.organizationName,
    required this.summary,
    required this.category,
    required this.difficulty,
    required this.startsAt,
    required this.durationMinutes,
    required this.placeName,
    required this.volunteersNeeded,
    required this.volunteersJoined,
    required this.skills,
    required this.matchScore,
    required this.matchReason,
    this.isRemote = false,
  });

  final String id;
  final String title;
  final String organizationName;
  final String summary;
  final ImpactCategory category;
  final Difficulty difficulty;
  final DateTime startsAt;
  final int durationMinutes;
  final String placeName;
  final int volunteersNeeded;
  final int volunteersJoined;
  final List<String> skills;

  /// 0 to 1, from the skill-matching logic.
  final double matchScore;

  /// Plain-language explanation of the match, shown with the score.
  final String matchReason;
  final bool isRemote;

  int get spotsLeft =>
      (volunteersNeeded - volunteersJoined).clamp(0, volunteersNeeded);

  bool get isFull => spotsLeft == 0;
}
