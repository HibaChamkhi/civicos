import 'package:flutter/foundation.dart';

/// Extra text scaling applied on top of the phone's own text-size setting.
enum TextSizeStep {
  small(0.9),
  standard(1),
  large(1.15),
  larger(1.3),
  largest(1.5);

  const TextSizeStep(this.factor);

  final double factor;

  static TextSizeStep fromStorage(String? stored) {
    for (final step in values) {
      if (step.name == stored) return step;
    }
    return TextSizeStep.standard;
  }
}

/// The typeface used for everything people read (headings stay Lexend).
enum ReadingFont {
  /// Figtree: clean and friendly.
  standard,

  /// Atkinson Hyperlegible Next: designed for low vision, with letters that
  /// are easy to confuse (I, l, 1; O, 0) drawn clearly differently.
  hyperlegible;

  static ReadingFont fromStorage(String? stored) {
    for (final font in values) {
      if (font.name == stored) return font;
    }
    return ReadingFont.standard;
  }
}

/// Reading-comfort preferences for this device.
@immutable
class ComfortSettings {
  const ComfortSettings({
    this.textSize = TextSizeStep.standard,
    this.font = ReadingFont.standard,
    this.calmMode = false,
  });

  final TextSizeStep textSize;
  final ReadingFont font;

  /// Turns off movement and vibration everywhere in the app.
  final bool calmMode;

  bool get isDefault => this == const ComfortSettings();

  ComfortSettings copyWith({
    TextSizeStep? textSize,
    ReadingFont? font,
    bool? calmMode,
  }) {
    return ComfortSettings(
      textSize: textSize ?? this.textSize,
      font: font ?? this.font,
      calmMode: calmMode ?? this.calmMode,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ComfortSettings &&
      other.textSize == textSize &&
      other.font == font &&
      other.calmMode == calmMode;

  @override
  int get hashCode => Object.hash(textSize, font, calmMode);
}
