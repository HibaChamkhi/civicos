import 'package:flutter/animation.dart';

/// Raw brand palette ("calm wayfinding": soft ink on mist, warm honey for
/// what you can act on). Nothing is pure black or pure white, which cuts
/// glare and halation. Widgets never read these directly; they go through
/// `CivicColors` so the light and dark themes always resolve as a set.
abstract final class CivicPalette {
  // Light ("mist")
  static const mist = Color(0xFFF5F5F0);
  static const paper = Color(0xFFFCFCFA);
  static const mistSunken = Color(0xFFECECE6);
  static const kerb = Color(0xFFE2E2DB);
  static const kerbStrong = Color(0xFFCBCBC3);
  static const softInk = Color(0xFF22252B);
  static const inkButton = Color(0xFF2A2F38);
  static const onInk = Color(0xFFFAFAF7);
  static const slate = Color(0xFF62676F);
  static const slateFaint = Color(0xFF8A8F96);
  static const honey = Color(0xFFF5C451);
  static const honeyInk = Color(0xFF7A5A00);
  static const honeyWashLight = Color(0xFFFBEFCB);

  // Dark ("dusk"): charcoal rather than black, text slightly dimmed.
  static const dusk = Color(0xFF17191E);
  static const duskSurface = Color(0xFF1F2228);
  static const duskSunken = Color(0xFF1B1D22);
  static const duskBorder = Color(0xFF2D3139);
  static const duskBorderStrong = Color(0xFF3C414B);
  static const chalk = Color(0xFFE7E6E1);
  static const chalkMuted = Color(0xFFA6ABB3);
  static const chalkFaint = Color(0xFF7D838C);
  static const honeyDark = Color(0xFFF2C45A);
  static const onHoney = Color(0xFF1F2126);
  static const honeyWashDark = Color(0xFF3A3120);

  static const successLight = Color(0xFF1E7A4F);
  static const warningLight = Color(0xFF946200);
  static const dangerLight = Color(0xFFBE2E33);
  static const infoLight = Color(0xFF2F5FC4);
  static const successDark = Color(0xFF4CC38A);
  static const warningDark = Color(0xFFEBB33A);
  static const dangerDark = Color(0xFFEF7276);
  static const infoDark = Color(0xFF86A8F2);
}

/// 4-pt spacing scale.
abstract final class Space {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 40;
  static const double huge = 48;
  static const double giant = 64;

  /// Horizontal padding between screen edge and content.
  static const double gutter = 20;
}

/// Generous, soft corners.
abstract final class Radii {
  static const double sm = 10;
  static const double md = 14;
  static const double lg = 20;
  static const double dock = 26;
  static const double sheet = 28;
  static const double pill = 999;
}

abstract final class Motion {
  static const fast = Duration(milliseconds: 120);
  static const base = Duration(milliseconds: 200);
  static const slow = Duration(milliseconds: 360);
  static const Curve standard = Curves.easeOutCubic;

  /// For things that travel, like the tab pill: quick start, soft landing.
  static const Curve glide = Curves.easeOutQuart;
  static const double pressedScale = 0.97;
}

abstract final class Sizes {
  /// Minimum touch target on every platform (WCAG 2.5.8 / Material).
  static const double minTouchTarget = 48;

  /// Tab labels stop growing past this text scale so the bar stays usable.
  static const double tabLabelMaxTextScale = 1.3;
}

abstract final class CivicFonts {
  /// Headings. Lexend was designed to reduce visual stress while reading.
  static const display = 'Lexend';

  /// Everything people read. Friendly, open shapes that stay clear small.
  static const body = 'Figtree';

  /// Optional reading font for low vision (Reading comfort setting).
  /// Latin only, like the two above.
  static const hyperlegible = 'AtkinsonHyperlegibleNext';

  /// Arabic text: used as the main face in Arabic, and as the fallback for
  /// Arabic words appearing inside English text.
  static const arabic = 'IBMPlexSansArabic';
}
