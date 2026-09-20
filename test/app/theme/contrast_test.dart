import 'package:civicos/app/theme/civic_colors.dart';
import 'package:civicos/core/utils/contrast.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('contrastRatio', () {
    test('black on white is 21:1 and symmetric', () {
      const black = Color(0xFF000000);
      const white = Color(0xFFFFFFFF);
      expect(contrastRatio(black, white), closeTo(21, 0.01));
      expect(contrastRatio(white, black), closeTo(21, 0.01));
    });

    test('a color against itself is 1:1', () {
      const grey = Color(0xFF777777);
      expect(contrastRatio(grey, grey), closeTo(1, 0.0001));
    });
  });

  // Every text/background pair the design system actually uses must meet
  // WCAG AA (4.5:1) in both themes.
  for (final entry in {
    'light': CivicColors.light,
    'dark': CivicColors.dark,
  }.entries) {
    final c = entry.value;
    final pairs = <String, (Color, Color)>{
      'text on background': (c.text, c.background),
      'text on surface': (c.text, c.surface),
      'text on sunken surface': (c.text, c.surfaceSunken),
      'muted text on background': (c.textMuted, c.background),
      'muted text on surface': (c.textMuted, c.surface),
      'on-primary on primary (buttons)': (c.onPrimary, c.primary),
      'on-accent on accent (tab pill, XP)': (c.onAccent, c.accent),
      'accent text on background': (c.accentText, c.background),
      'accent text on surface': (c.accentText, c.surface),
      'accent text on accent wash': (c.accentText, c.accentWash),
      'danger on surface (errors)': (c.danger, c.surface),
      'success on surface (status)': (c.success, c.surface),
      'warning on surface (status)': (c.warning, c.surface),
      'info on surface (status)': (c.info, c.surface),
      'background on text (snackbar)': (c.background, c.text),
    };

    group('${entry.key} theme meets WCAG AA', () {
      pairs.forEach((name, pair) {
        test(name, () {
          final ratio = contrastRatio(pair.$1, pair.$2);
          expect(
            ratio,
            greaterThanOrEqualTo(wcagAaNormalText),
            reason: '$name is ${ratio.toStringAsFixed(2)}:1',
          );
        });
      });
    });
  }
}
