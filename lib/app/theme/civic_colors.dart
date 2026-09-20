import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/app/theme/tone.dart';
import 'package:flutter/material.dart';

/// Semantic color tokens. Read them with `context.civic`.
@immutable
class CivicColors extends ThemeExtension<CivicColors> {
  const CivicColors({
    required this.background,
    required this.surface,
    required this.surfaceSunken,
    required this.border,
    required this.borderStrong,
    required this.text,
    required this.textMuted,
    required this.textFaint,
    required this.primary,
    required this.onPrimary,
    required this.accent,
    required this.onAccent,
    required this.accentText,
    required this.accentWash,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
  });

  static const light = CivicColors(
    background: CivicPalette.mist,
    surface: CivicPalette.paper,
    surfaceSunken: CivicPalette.mistSunken,
    border: CivicPalette.kerb,
    borderStrong: CivicPalette.kerbStrong,
    text: CivicPalette.softInk,
    textMuted: CivicPalette.slate,
    textFaint: CivicPalette.slateFaint,
    primary: CivicPalette.inkButton,
    onPrimary: CivicPalette.onInk,
    accent: CivicPalette.honey,
    onAccent: CivicPalette.softInk,
    accentText: CivicPalette.honeyInk,
    accentWash: CivicPalette.honeyWashLight,
    success: CivicPalette.successLight,
    warning: CivicPalette.warningLight,
    danger: CivicPalette.dangerLight,
    info: CivicPalette.infoLight,
  );

  static const dark = CivicColors(
    background: CivicPalette.dusk,
    surface: CivicPalette.duskSurface,
    surfaceSunken: CivicPalette.duskSunken,
    border: CivicPalette.duskBorder,
    borderStrong: CivicPalette.duskBorderStrong,
    text: CivicPalette.chalk,
    textMuted: CivicPalette.chalkMuted,
    textFaint: CivicPalette.chalkFaint,
    primary: CivicPalette.honeyDark,
    onPrimary: CivicPalette.onHoney,
    accent: CivicPalette.honeyDark,
    onAccent: CivicPalette.onHoney,
    accentText: CivicPalette.honeyDark,
    accentWash: CivicPalette.honeyWashDark,
    success: CivicPalette.successDark,
    warning: CivicPalette.warningDark,
    danger: CivicPalette.dangerDark,
    info: CivicPalette.infoDark,
  );

  final Color background;
  final Color surface;
  final Color surfaceSunken;
  final Color border;
  final Color borderStrong;
  final Color text;
  final Color textMuted;

  /// Decorative only (dividers' labels, disabled glyphs). Never body text.
  final Color textFaint;
  final Color primary;
  final Color onPrimary;

  /// Marker yellow. A fill, never text on a light ground.
  final Color accent;
  final Color onAccent;

  /// Readable text color for the accent family on the current ground.
  final Color accentText;
  final Color accentWash;
  final Color success;
  final Color warning;
  final Color danger;
  final Color info;

  /// Foreground color for status UI of the given [tone].
  Color toneColor(Tone tone) => switch (tone) {
    Tone.neutral => textMuted,
    Tone.info => info,
    Tone.success => success,
    Tone.warning => warning,
    Tone.danger => danger,
    Tone.accent => accentText,
  };

  @override
  CivicColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceSunken,
    Color? border,
    Color? borderStrong,
    Color? text,
    Color? textMuted,
    Color? textFaint,
    Color? primary,
    Color? onPrimary,
    Color? accent,
    Color? onAccent,
    Color? accentText,
    Color? accentWash,
    Color? success,
    Color? warning,
    Color? danger,
    Color? info,
  }) {
    return CivicColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceSunken: surfaceSunken ?? this.surfaceSunken,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      text: text ?? this.text,
      textMuted: textMuted ?? this.textMuted,
      textFaint: textFaint ?? this.textFaint,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      accentText: accentText ?? this.accentText,
      accentWash: accentWash ?? this.accentWash,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      info: info ?? this.info,
    );
  }

  @override
  CivicColors lerp(covariant CivicColors? other, double t) {
    if (other == null) return this;
    Color mix(Color a, Color b) => Color.lerp(a, b, t)!;
    return CivicColors(
      background: mix(background, other.background),
      surface: mix(surface, other.surface),
      surfaceSunken: mix(surfaceSunken, other.surfaceSunken),
      border: mix(border, other.border),
      borderStrong: mix(borderStrong, other.borderStrong),
      text: mix(text, other.text),
      textMuted: mix(textMuted, other.textMuted),
      textFaint: mix(textFaint, other.textFaint),
      primary: mix(primary, other.primary),
      onPrimary: mix(onPrimary, other.onPrimary),
      accent: mix(accent, other.accent),
      onAccent: mix(onAccent, other.onAccent),
      accentText: mix(accentText, other.accentText),
      accentWash: mix(accentWash, other.accentWash),
      success: mix(success, other.success),
      warning: mix(warning, other.warning),
      danger: mix(danger, other.danger),
      info: mix(info, other.info),
    );
  }
}
