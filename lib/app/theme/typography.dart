import 'package:civicos/app/theme/civic_colors.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// The CivicOS type scale. Read it with `context.type`.
///
/// Headings use Lexend at medium weights (no heavy blacks), body text uses
/// Figtree with roomy line height. Sizes are logical pixels and scale with
/// the system text-size setting.
@immutable
class CivicTypography extends ThemeExtension<CivicTypography> {
  const CivicTypography({
    required this.display,
    required this.title1,
    required this.title2,
    required this.headline,
    required this.body,
    required this.callout,
    required this.footnote,
    required this.label,
    required this.button,
    required this.tabLabel,
  });

  factory CivicTypography.fromColors(
    CivicColors colors, {
    String displayFamily = CivicFonts.display,
    String bodyFamily = CivicFonts.body,
  }) {
    // Lexend, Figtree and Atkinson carry no Arabic letters, so every style
    // falls back to the Arabic face for Arabic text.
    const fallback = [CivicFonts.arabic];
    TextStyle heading(
      double size,
      double lineHeight,
      FontWeight weight,
      double tracking,
    ) {
      return TextStyle(
        fontFamily: displayFamily,
        fontFamilyFallback: fallback,
        fontSize: size,
        height: lineHeight / size,
        fontWeight: weight,
        letterSpacing: tracking,
        color: colors.text,
      );
    }

    TextStyle body(double size, double lineHeight, FontWeight weight) {
      return TextStyle(
        fontFamily: bodyFamily,
        fontFamilyFallback: fallback,
        fontSize: size,
        height: lineHeight / size,
        fontWeight: weight,
        color: colors.text,
      );
    }

    return CivicTypography(
      display: heading(36, 42, FontWeight.w700, -0.6),
      title1: heading(28, 35, FontWeight.w600, -0.4),
      title2: heading(21, 28, FontWeight.w600, -0.2),
      headline: body(17, 24, FontWeight.w600),
      body: body(16, 25, FontWeight.w400),
      callout: body(15, 22, FontWeight.w400),
      footnote: body(13, 19, FontWeight.w400).copyWith(color: colors.textMuted),
      label: body(
        12,
        16,
        FontWeight.w600,
      ).copyWith(letterSpacing: 0.8, color: colors.textMuted),
      button: body(16, 20, FontWeight.w600),
      tabLabel: body(12, 16, FontWeight.w500),
    );
  }

  /// Hero numbers and the biggest headings.
  final TextStyle display;
  final TextStyle title1;
  final TextStyle title2;

  /// Emphasized body-size line, such as a card title.
  final TextStyle headline;
  final TextStyle body;
  final TextStyle callout;

  /// Metadata: timestamps, counts, secondary facts.
  final TextStyle footnote;

  /// Small uppercase eyebrow labels. Apply `toUpperCase()` to the string.
  final TextStyle label;
  final TextStyle button;
  final TextStyle tabLabel;

  /// Maps the scale onto Material's slots so stock widgets pick it up.
  TextTheme toTextTheme() => TextTheme(
    displayMedium: display,
    headlineMedium: title1,
    headlineSmall: title2,
    titleLarge: title2,
    titleMedium: headline,
    titleSmall: headline.copyWith(fontSize: 15),
    bodyLarge: body,
    bodyMedium: callout,
    bodySmall: footnote,
    labelLarge: button,
    labelMedium: tabLabel,
    labelSmall: label,
  );

  @override
  CivicTypography copyWith({
    TextStyle? display,
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? headline,
    TextStyle? body,
    TextStyle? callout,
    TextStyle? footnote,
    TextStyle? label,
    TextStyle? button,
    TextStyle? tabLabel,
  }) {
    return CivicTypography(
      display: display ?? this.display,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      headline: headline ?? this.headline,
      body: body ?? this.body,
      callout: callout ?? this.callout,
      footnote: footnote ?? this.footnote,
      label: label ?? this.label,
      button: button ?? this.button,
      tabLabel: tabLabel ?? this.tabLabel,
    );
  }

  @override
  CivicTypography lerp(covariant CivicTypography? other, double t) {
    if (other == null) return this;
    TextStyle mix(TextStyle a, TextStyle b) => TextStyle.lerp(a, b, t)!;
    return CivicTypography(
      display: mix(display, other.display),
      title1: mix(title1, other.title1),
      title2: mix(title2, other.title2),
      headline: mix(headline, other.headline),
      body: mix(body, other.body),
      callout: mix(callout, other.callout),
      footnote: mix(footnote, other.footnote),
      label: mix(label, other.label),
      button: mix(button, other.button),
      tabLabel: mix(tabLabel, other.tabLabel),
    );
  }
}
