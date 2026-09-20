import 'package:civicos/core/preferences/theme_preference.dart';
import 'package:civicos/l10n/l10n.dart';

String themePreferenceLabel(AppLocalizations l10n, ThemePreference value) {
  return switch (value) {
    ThemePreference.system => l10n.appearanceSystem,
    ThemePreference.light => l10n.appearanceLight,
    ThemePreference.dark => l10n.appearanceDark,
  };
}

String themePreferenceDescription(
  AppLocalizations l10n,
  ThemePreference value,
) {
  return switch (value) {
    ThemePreference.system => l10n.appearanceSystemSubtitle,
    ThemePreference.light => l10n.appearanceLightSubtitle,
    ThemePreference.dark => l10n.appearanceDarkSubtitle,
  };
}
