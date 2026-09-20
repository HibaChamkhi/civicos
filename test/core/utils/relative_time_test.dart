import 'package:civicos/core/utils/relative_time.dart';
import 'package:civicos/l10n/app_localizations_en.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final l10n = AppLocalizationsEn();
  final now = DateTime(2026, 9, 12, 12);

  group('relativeTime', () {
    test('describes how long ago something happened', () {
      String ago(Duration elapsed) =>
          relativeTime(l10n, now.subtract(elapsed), now: now);

      expect(ago(const Duration(seconds: 30)), 'just now');
      expect(ago(const Duration(minutes: 1)), '1 min ago');
      expect(ago(const Duration(minutes: 45)), '45 min ago');
      expect(ago(const Duration(hours: 1)), '1 h ago');
      expect(ago(const Duration(hours: 5)), '5 h ago');
      expect(ago(const Duration(days: 1)), 'yesterday');
      expect(ago(const Duration(days: 3)), '3 days ago');
      expect(ago(const Duration(days: 7)), 'last week');
      expect(ago(const Duration(days: 21)), '3 weeks ago');
    });
  });

  group('relativeFuture', () {
    test('describes when something starts', () {
      String ahead(Duration until) =>
          relativeFuture(l10n, now.add(until), now: now);

      expect(ahead(const Duration(hours: 3)), 'today');
      expect(ahead(const Duration(days: 1)), 'tomorrow');
      expect(ahead(const Duration(days: 3)), 'in 3 days');
      expect(ahead(const Duration(days: 8)), 'next week');
      expect(ahead(const Duration(days: 15)), 'in 2 weeks');
    });

    test('counts calendar days, not 24-hour blocks', () {
      // 11 pm today to 1 am tomorrow is two hours, but it is "tomorrow".
      final lateTonight = DateTime(2026, 9, 12, 23);
      final earlyTomorrow = DateTime(2026, 9, 13, 1);
      expect(
        relativeFuture(l10n, earlyTomorrow, now: lateTonight),
        'tomorrow',
      );
    });
  });

  group('durationLabel', () {
    test('reads naturally for minutes and hours', () {
      expect(durationLabel(l10n, 45), '45 min');
      expect(durationLabel(l10n, 60), '1 h');
      expect(durationLabel(l10n, 90), '1 h 30');
      expect(durationLabel(l10n, 180), '3 h');
    });
  });

  group('distanceLabel', () {
    test('switches to kilometres above 1000 m', () {
      expect(distanceLabel(l10n, 320), '320 m');
      expect(distanceLabel(l10n, 999), '999 m');
      expect(distanceLabel(l10n, 1000), '1.0 km');
      expect(distanceLabel(l10n, 1200), '1.2 km');
    });
  });
}
