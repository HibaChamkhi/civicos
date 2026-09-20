import 'package:civicos/app/theme/civic_colors.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/app/theme/typography.dart';
import 'package:civicos/core/preferences/comfort_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Builds Material [ThemeData] from the CivicOS tokens so stock widgets
/// (app bars, switches, inputs, the navigation bar) match the design system.
abstract final class AppTheme {
  static ThemeData light({
    ComfortSettings comfort = const ComfortSettings(),
    bool arabic = false,
  }) => _build(Brightness.light, CivicColors.light, comfort, arabic: arabic);

  static ThemeData dark({
    ComfortSettings comfort = const ComfortSettings(),
    bool arabic = false,
  }) => _build(Brightness.dark, CivicColors.dark, comfort, arabic: arabic);

  static ThemeData _build(
    Brightness brightness,
    CivicColors c,
    ComfortSettings comfort, {
    required bool arabic,
  }) {
    // In Arabic both roles use IBM Plex Sans Arabic: Lexend and Figtree have
    // no Arabic letters, and the extra-legible face is Latin-only too.
    final displayFamily = arabic ? CivicFonts.arabic : CivicFonts.display;
    final bodyFamily = arabic
        ? CivicFonts.arabic
        : switch (comfort.font) {
            ReadingFont.standard => CivicFonts.body,
            ReadingFont.hyperlegible => CivicFonts.hyperlegible,
          };
    final type = CivicTypography.fromColors(
      c,
      displayFamily: displayFamily,
      bodyFamily: bodyFamily,
    );
    final isLight = brightness == Brightness.light;

    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.primary,
      onPrimary: c.onPrimary,
      secondary: c.accent,
      onSecondary: c.onAccent,
      tertiary: c.info,
      onTertiary: c.surface,
      error: c.danger,
      onError: c.surface,
      surface: c.surface,
      onSurface: c.text,
      onSurfaceVariant: c.textMuted,
      surfaceContainerLowest: c.surface,
      surfaceContainerLow: c.surface,
      surfaceContainer: c.surface,
      surfaceContainerHigh: c.surfaceSunken,
      surfaceContainerHighest: c.surfaceSunken,
      outline: c.borderStrong,
      outlineVariant: c.border,
      inverseSurface: c.text,
      onInverseSurface: c.background,
      shadow: Colors.black,
      scrim: Colors.black,
      surfaceTint: Colors.transparent,
    );

    final overlayStyle =
        (isLight ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light)
            .copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarContrastEnforced: false,
            );

    OutlineInputBorder inputBorder(Color color, double width) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radii.md),
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      canvasColor: c.background,
      fontFamily: bodyFamily,
      textTheme: type.toTextTheme(),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      splashFactory: InkRipple.splashFactory,
      extensions: <ThemeExtension<dynamic>>[c, type],
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        foregroundColor: c.text,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: type.headline,
        systemOverlayStyle: overlayStyle,
      ),
      dividerTheme: DividerThemeData(color: c.border, thickness: 1, space: 1),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        border: inputBorder(c.borderStrong, 1.5),
        enabledBorder: inputBorder(c.borderStrong, 1.5),
        focusedBorder: inputBorder(c.text, 2),
        errorBorder: inputBorder(c.danger, 1.5),
        focusedErrorBorder: inputBorder(c.danger, 2),
        disabledBorder: inputBorder(c.border, 1.5),
        labelStyle: type.callout.copyWith(color: c.textMuted),
        floatingLabelStyle: type.callout.copyWith(color: c.text),
        hintStyle: type.callout.copyWith(color: c.textMuted),
        helperStyle: type.footnote,
        errorStyle: type.footnote.copyWith(color: c.danger),
        helperMaxLines: 3,
        errorMaxLines: 3,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: c.text,
        textColor: c.text,
        titleTextStyle: type.body,
        subtitleTextStyle: type.footnote,
        minVerticalPadding: Space.sm,
        contentPadding: const EdgeInsets.symmetric(horizontal: Space.gutter),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? c.onPrimary : c.textMuted,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.primary
              : c.surfaceSunken,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.primary
              : c.borderStrong,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? c.primary : c.textMuted,
        ),
      ),
      sliderTheme: SliderThemeData(
        trackHeight: 6,
        activeTrackColor: c.primary,
        inactiveTrackColor: c.surfaceSunken,
        thumbColor: c.primary,
        overlayColor: c.primary.withValues(alpha: 0.12),
        activeTickMarkColor: c.onPrimary,
        inactiveTickMarkColor: c.borderStrong,
        valueIndicatorColor: c.text,
        valueIndicatorTextStyle: type.footnote.copyWith(color: c.background),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.primary,
        linearTrackColor: c.surfaceSunken,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: c.text,
        contentTextStyle: type.callout.copyWith(color: c.background),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Radii.md),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: c.text,
          borderRadius: BorderRadius.circular(Radii.sm),
        ),
        textStyle: type.footnote.copyWith(color: c.background),
      ),
    );
  }
}

extension CivicThemeContext on BuildContext {
  /// Semantic color tokens for the active theme.
  CivicColors get civic => Theme.of(this).extension<CivicColors>()!;

  /// Type scale for the active theme.
  CivicTypography get type => Theme.of(this).extension<CivicTypography>()!;
}
