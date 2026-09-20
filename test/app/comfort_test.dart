import 'package:civicos/core/storage/key_value_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/in_memory_key_value_store.dart';
import '../helpers/pump_app.dart';

/// A heading Home always shows, whatever the content below it.
const _homeHeading = 'Open near you';

Future<void> _openComfort(WidgetTester tester) async {
  await tester.tap(find.byTooltip('Settings').first);
  await tester.pumpAndSettle();
  await tester.tap(find.text('Reading comfort'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('the largest text size scales text across the app', (
    tester,
  ) async {
    await pumpCivicApp(
      tester,
      store: InMemoryKeyValueStore({PreferenceKeys.textSize: 'largest'}),
    );

    final heading = tester.element(find.text(_homeHeading));
    expect(MediaQuery.textScalerOf(heading).scale(10), closeTo(15, 0.01));
  });

  testWidgets('calm mode turns off animations app-wide', (tester) async {
    await pumpCivicApp(
      tester,
      store: InMemoryKeyValueStore({PreferenceKeys.calmMode: true}),
    );

    final heading = tester.element(find.text(_homeHeading));
    expect(MediaQuery.disableAnimationsOf(heading), isTrue);
  });

  testWidgets('the extra-legible font replaces the reading font', (
    tester,
  ) async {
    await pumpCivicApp(
      tester,
      store: InMemoryKeyValueStore({
        PreferenceKeys.readingFont: 'hyperlegible',
      }),
    );

    final heading = tester.element(find.text(_homeHeading));
    expect(
      Theme.of(heading).textTheme.bodyLarge!.fontFamily,
      'AtkinsonHyperlegibleNext',
    );
  });

  testWidgets('moving the slider saves a bigger text size', (tester) async {
    final store = InMemoryKeyValueStore();
    await pumpCivicApp(tester, store: store);
    await _openComfort(tester);

    await tester.drag(find.byType(Slider), const Offset(400, 0));
    await tester.pumpAndSettle();

    expect(store.values[PreferenceKeys.textSize], 'largest');
    expect(find.text('Largest · 150%'), findsOneWidget);
  });

  testWidgets('calm mode also switches off haptics in Settings', (
    tester,
  ) async {
    await pumpCivicApp(
      tester,
      store: InMemoryKeyValueStore({PreferenceKeys.calmMode: true}),
    );

    await tester.tap(find.byTooltip('Settings').first);
    await tester.pumpAndSettle();

    expect(find.text('Off while calm mode is on.'), findsOneWidget);
    final haptics = tester.widget<Switch>(find.byType(Switch));
    expect(haptics.onChanged, isNull);
  });

  testWidgets('reset appears only after a change and restores defaults', (
    tester,
  ) async {
    final store = InMemoryKeyValueStore({PreferenceKeys.calmMode: true});
    await pumpCivicApp(tester, store: store);
    await _openComfort(tester);

    // The button sits at the end of a lazily built list: scroll until it is
    // built, then bring it fully on screen before tapping.
    final reset = find.text('Reset to defaults');
    await tester.scrollUntilVisible(reset, 300);
    await tester.ensureVisible(reset);
    await tester.pumpAndSettle();
    await tester.tap(reset);
    await tester.pumpAndSettle();

    expect(find.text('Reset to defaults'), findsNothing);
    expect(store.values[PreferenceKeys.calmMode], isFalse);
  });

  testWidgets('the comfort screen fits at the largest size', (tester) async {
    await pumpCivicApp(
      tester,
      store: InMemoryKeyValueStore({PreferenceKeys.textSize: 'largest'}),
    );
    await _openComfort(tester);

    expect(tester.takeException(), isNull);
  });
}
