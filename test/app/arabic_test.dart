import 'package:civicos/core/storage/key_value_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/in_memory_key_value_store.dart';
import '../helpers/pump_app.dart';

InMemoryKeyValueStore _arabicStore() =>
    InMemoryKeyValueStore({PreferenceKeys.language: 'arabic'});

void main() {
  testWidgets('in Arabic the app lays out right to left', (tester) async {
    await pumpCivicApp(tester, store: _arabicStore());

    final direction = Directionality.of(
      tester.element(find.text('الرئيسية').first),
    );
    expect(direction, TextDirection.rtl);
  });

  testWidgets('the interface is translated', (tester) async {
    await pumpCivicApp(tester, store: _arabicStore());

    for (final label in ['الرئيسية', 'الخريطة', 'شارِك', 'تعلّم', 'حسابي']) {
      expect(find.text(label), findsWidgets, reason: label);
    }
    expect(find.text('مفتوحة قربك'), findsOneWidget);
    expect(find.text('عرض الكل'), findsWidgets);
  });

  testWidgets('content is Arabic too, not half-translated', (tester) async {
    await pumpCivicApp(tester, store: _arabicStore());

    expect(
      find.text('عمود إنارة معطّل في شارع الزياتين'),
      findsOneWidget,
    );
    expect(find.text('قيد التنفيذ'), findsOneWidget);
    expect(find.textContaining('محتوى تجريبي'), findsOneWidget);
  });

  testWidgets('Arabic uses a typeface that has Arabic letters', (tester) async {
    await pumpCivicApp(tester, store: _arabicStore());

    // Read the theme from inside the app, not above it, where Flutter's
    // own default theme would answer instead.
    final theme = Theme.of(tester.element(find.text('الرئيسية').first));
    expect(theme.textTheme.bodyLarge!.fontFamily, 'IBMPlexSansArabic');
    expect(theme.textTheme.headlineMedium!.fontFamily, 'IBMPlexSansArabic');
  });

  testWidgets('English is left to right and uses Figtree', (tester) async {
    await pumpCivicApp(tester);

    final context = tester.element(find.text('Home').first);
    expect(Directionality.of(context), TextDirection.ltr);
    expect(Theme.of(context).textTheme.bodyLarge!.fontFamily, 'Figtree');
    // Latin text still falls back to the Arabic face when it meets Arabic.
    expect(
      Theme.of(context).textTheme.bodyLarge!.fontFamilyFallback,
      contains('IBMPlexSansArabic'),
    );
  });

  testWidgets('choosing العربية in Settings switches and saves it', (
    tester,
  ) async {
    final store = InMemoryKeyValueStore();
    await pumpCivicApp(tester, store: store);

    await tester.tap(find.byTooltip('Settings').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Language'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('العربية'));
    await tester.pumpAndSettle();

    expect(store.values[PreferenceKeys.language], 'arabic');
    expect(find.text('اللغة'), findsWidgets);
  });

  testWidgets('each language option is written in its own language', (
    tester,
  ) async {
    await pumpCivicApp(tester);

    await tester.tap(find.byTooltip('Settings').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Language'));
    await tester.pumpAndSettle();

    expect(find.text('English'), findsOneWidget);
    expect(find.text('العربية'), findsOneWidget);
  });
}
