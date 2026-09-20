/// How the person wants CivicOS to look on this device.
enum ThemePreference {
  system,
  light,
  dark;

  /// Unknown or missing stored values fall back to following the phone.
  static ThemePreference fromStorage(String? stored) {
    for (final preference in values) {
      if (preference.name == stored) return preference;
    }
    return ThemePreference.system;
  }
}
