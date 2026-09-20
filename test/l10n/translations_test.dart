import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

Map<String, String> _messages(String path) {
  final raw = jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
  return {
    for (final entry in raw.entries)
      if (!entry.key.startsWith('@')) entry.key: entry.value as String,
  };
}

/// Placeholders the English template declares for each message, read from
/// its `@key` metadata. Reading the declarations avoids mistaking an ICU
/// plural form such as `=1{yesterday}` for a placeholder.
Map<String, Set<String>> _declaredPlaceholders(String path) {
  final raw = jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
  final declared = <String, Set<String>>{};
  for (final entry in raw.entries) {
    if (!entry.key.startsWith('@') || entry.key.startsWith('@@')) continue;
    final meta = entry.value as Map<String, dynamic>;
    final placeholders = meta['placeholders'] as Map<String, dynamic>?;
    if (placeholders == null) continue;
    declared[entry.key.substring(1)] = placeholders.keys.toSet();
  }
  return declared;
}

void main() {
  final en = _messages('lib/l10n/app_en.arb');
  final ar = _messages('lib/l10n/app_ar.arb');

  test('Arabic translates every English string', () {
    expect(en, isNotEmpty);
    expect(
      en.keys.toSet().difference(ar.keys.toSet()),
      isEmpty,
      reason: 'missing Arabic translations',
    );
  });

  test('Arabic has no strings English does not', () {
    expect(
      ar.keys.toSet().difference(en.keys.toSet()),
      isEmpty,
      reason: 'stale Arabic keys',
    );
  });

  test('no translation is blank, and none is left in English', () {
    const sameInBothLanguages = {
      'appTitle', // brand name
      'languageEnglish',
      'languageArabic',
    };
    for (final entry in ar.entries) {
      expect(entry.value.trim(), isNotEmpty, reason: entry.key);
      if (!sameInBothLanguages.contains(entry.key)) {
        expect(entry.value, isNot(en[entry.key]), reason: entry.key);
      }
    }
  });

  test('every translation keeps the placeholders it needs', () {
    final declared = _declaredPlaceholders('lib/l10n/app_en.arb');
    expect(declared, isNotEmpty);
    declared.forEach((key, placeholders) {
      for (final name in placeholders) {
        expect(ar[key], contains('{$name'), reason: '$key must keep {$name}');
      }
    });
  });

  test('Arabic plurals cover the forms Arabic actually uses', () {
    // Arabic distinguishes one, two, few and many; English only has one and
    // other, so copying the English shape would read wrong.
    for (final entry in ar.entries) {
      if (!entry.value.contains('plural,')) continue;
      for (final form in ['one{', 'two{', 'few{', 'many{', 'other{']) {
        expect(entry.value, contains(form), reason: '${entry.key} needs $form');
      }
    }
  });
}
