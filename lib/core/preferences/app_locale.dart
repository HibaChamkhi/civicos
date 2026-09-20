import 'package:civicos/core/preferences/app_language.dart';
import 'package:civicos/core/preferences/preferences_controllers.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale.g.dart';

/// The locale the app actually runs in: the chosen language, or the first
/// phone language CivicOS supports, or English.
@Riverpod(keepAlive: true)
Locale appLocale(Ref ref) {
  final chosen = ref.watch(languageControllerProvider).locale;
  if (chosen != null) return chosen;

  final supported = AppLanguage.values
      .map((language) => language.locale)
      .nonNulls;
  for (final deviceLocale
      in WidgetsBinding.instance.platformDispatcher.locales) {
    for (final locale in supported) {
      if (locale.languageCode == deviceLocale.languageCode) return locale;
    }
  }
  return const Locale('en');
}

/// Whether text runs right to left, which also decides the Arabic typeface.
@Riverpod(keepAlive: true)
bool isArabic(Ref ref) => ref.watch(appLocaleProvider).languageCode == 'ar';
