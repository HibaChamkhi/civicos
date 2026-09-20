import 'package:intl/intl.dart';

/// Locale-aware number formatting for impact figures.
abstract final class Formatters {
  /// `4.5`, `12`, `1,240.5`: at most [maxFractionDigits] decimals and no
  /// trailing zeros.
  static String decimal(
    num value, {
    int maxFractionDigits = 1,
    String? locale,
  }) {
    final format = NumberFormat.decimalPattern(locale)
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = maxFractionDigits;
    return format.format(value);
  }

  /// `980`, `1.2K`, `3.4M`, for tight spaces such as supporter counts.
  static String compact(num value, {String? locale}) {
    return NumberFormat.compact(locale: locale).format(value);
  }
}
