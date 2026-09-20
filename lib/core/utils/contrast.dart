import 'dart:math' as math;

import 'package:flutter/painting.dart';

/// WCAG 2.x contrast ratio between two opaque colors, from 1 to 21.
double contrastRatio(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  return (math.max(la, lb) + 0.05) / (math.min(la, lb) + 0.05);
}

/// Minimum ratio for normal-size text (WCAG AA).
const double wcagAaNormalText = 4.5;
