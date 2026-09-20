import 'dart:math' as math;

import 'package:civicos/app/router/app_router.dart';
import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/core/preferences/app_locale.dart';
import 'package:civicos/core/preferences/comfort_settings.dart';
import 'package:civicos/core/preferences/preferences_controllers.dart';
import 'package:civicos/core/preferences/theme_preference.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/system/offline_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CivicApp extends ConsumerStatefulWidget {
  const CivicApp({super.key});

  /// Upper bound for the phone's text size multiplied by the in-app step.
  static const double maxTextScale = 3;

  @override
  ConsumerState<CivicApp> createState() => _CivicAppState();
}

class _CivicAppState extends ConsumerState<CivicApp> {
  @override
  void initState() {
    super.initState();
    // Preferences are loaded before runApp, so the first frame is already
    // in the right theme and the native splash can go.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => FlutterNativeSplash.remove(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    final preference = ref.watch(themePreferenceControllerProvider);
    final comfort = ref.watch(comfortControllerProvider);
    final language = ref.watch(languageControllerProvider);
    final arabic = ref.watch(isArabicProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(comfort: comfort, arabic: arabic),
      darkTheme: AppTheme.dark(comfort: comfort, arabic: arabic),
      themeMode: preference.themeMode,
      // null follows the phone; Flutter then picks the closest supported
      // locale and flips the whole app to right-to-left for Arabic.
      locale: language.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
      builder: (context, child) => MediaQuery(
        data: _applyComfort(MediaQuery.of(context), comfort),
        child: ConnectivityGate(child: child ?? const SizedBox.shrink()),
      ),
    );
  }

  /// Layers the in-app comfort settings on top of the phone's own settings;
  /// it never makes text smaller or motion stronger than the phone asks for
  /// unless the person chose so here.
  MediaQueryData _applyComfort(MediaQueryData media, ComfortSettings comfort) {
    final textScaler = comfort.textSize == TextSizeStep.standard
        ? media.textScaler
        : TextScaler.linear(
            math.min(
              media.textScaler.scale(16) / 16 * comfort.textSize.factor,
              CivicApp.maxTextScale,
            ),
          );
    return media.copyWith(
      textScaler: textScaler,
      disableAnimations: media.disableAnimations || comfort.calmMode,
    );
  }
}

extension on ThemePreference {
  ThemeMode get themeMode => switch (this) {
    ThemePreference.system => ThemeMode.system,
    ThemePreference.light => ThemeMode.light,
    ThemePreference.dark => ThemeMode.dark,
  };
}
