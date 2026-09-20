import 'dart:ui';

/// The language CivicOS uses on this device.
enum AppLanguage {
  /// Follow the phone, falling back to English when its language is not
  /// one CivicOS speaks.
  system(null),
  english(Locale('en')),
  arabic(Locale('ar'));

  const AppLanguage(this.locale);

  /// `null` means "whatever the phone is set to".
  final Locale? locale;

  static AppLanguage fromStorage(String? stored) {
    for (final language in values) {
      if (language.name == stored) return language;
    }
    return AppLanguage.system;
  }
}
