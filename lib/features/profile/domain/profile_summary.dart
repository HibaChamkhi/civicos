/// The signed-in person, as shown in headers and on the You tab.
class ProfileSummary {
  const ProfileSummary({
    required this.displayName,
    required this.neighborhood,
    required this.city,
    required this.skills,
    required this.interests,
    required this.memberSince,
    required this.trustScore,
  });

  final String displayName;

  /// People are placed at neighborhood level, never at exact coordinates.
  final String neighborhood;
  final String city;
  final List<String> skills;
  final List<String> interests;
  final DateTime memberSince;

  /// 0 to 100, earned from verified contributions.
  final int trustScore;

  String get firstName => displayName.split(' ').first;
}
