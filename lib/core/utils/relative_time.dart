import 'package:civicos/l10n/l10n.dart';

/// How long ago something happened, in words: "just now", "5 h ago",
/// "yesterday", "3 days ago", "2 weeks ago".
String relativeTime(AppLocalizations l10n, DateTime when, {DateTime? now}) {
  final elapsed = (now ?? DateTime.now()).difference(when);
  if (elapsed.inMinutes < 1) return l10n.timeJustNow;
  if (elapsed.inMinutes < 60) return l10n.timeMinutesAgo(elapsed.inMinutes);
  if (elapsed.inHours < 24) return l10n.timeHoursAgo(elapsed.inHours);
  if (elapsed.inDays < 7) return l10n.timeDaysAgo(elapsed.inDays);
  return l10n.timeWeeksAgo(elapsed.inDays ~/ 7);
}

/// How long until something starts: "today", "tomorrow", "in 3 days".
String relativeFuture(AppLocalizations l10n, DateTime when, {DateTime? now}) {
  final from = now ?? DateTime.now();
  final startOfToday = DateTime(from.year, from.month, from.day);
  final startOfDay = DateTime(when.year, when.month, when.day);
  final days = startOfDay.difference(startOfToday).inDays;
  if (days <= 0) return l10n.timeToday;
  if (days == 1) return l10n.timeTomorrow;
  if (days < 7) return l10n.timeInDays(days);
  return l10n.timeInWeeks(days ~/ 7);
}

/// A duration in hours and minutes: "3 h", "1 h 30", "45 min".
String durationLabel(AppLocalizations l10n, int minutes) {
  if (minutes < 60) return l10n.durationMinutes(minutes);
  final hours = minutes ~/ 60;
  final rest = minutes % 60;
  return rest == 0
      ? l10n.durationHours(hours)
      : l10n.durationHoursMinutes(hours, rest);
}

/// A distance from the person: "320 m", "1.2 km".
String distanceLabel(AppLocalizations l10n, int meters) {
  if (meters < 1000) return l10n.distanceMeters(meters);
  return l10n.distanceKilometers((meters / 1000).toStringAsFixed(1));
}
