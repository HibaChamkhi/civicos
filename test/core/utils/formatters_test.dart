import 'package:civicos/core/utils/formatters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Formatters.decimal', () {
    test('drops trailing zeros', () {
      expect(Formatters.decimal(12, locale: 'en'), '12');
      expect(Formatters.decimal(4.5, locale: 'en'), '4.5');
      expect(Formatters.decimal(4.50, locale: 'en'), '4.5');
    });

    test('rounds to the requested precision and groups thousands', () {
      expect(Formatters.decimal(1240.46, locale: 'en'), '1,240.5');
      expect(
        Formatters.decimal(3.14159, maxFractionDigits: 2, locale: 'en'),
        '3.14',
      );
    });

    test('follows the locale', () {
      expect(Formatters.decimal(1240.5, locale: 'fr'), '1 240,5');
    });
  });

  group('Formatters.compact', () {
    test('shortens large counts', () {
      expect(Formatters.compact(980, locale: 'en'), '980');
      expect(Formatters.compact(1200, locale: 'en'), '1.2K');
      expect(Formatters.compact(3400000, locale: 'en'), '3.4M');
    });
  });
}
