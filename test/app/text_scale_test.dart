import 'package:civicos/app/router/civic_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

/// Every Step 1 screen must render at 2x text size with no layout overflow.
/// Flutter reports overflow as an exception, which fails these tests.
void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized()
            .platformDispatcher
            .textScaleFactorTestValue =
        2;
  });

  tearDown(() {
    TestWidgetsFlutterBinding.ensureInitialized().platformDispatcher
        .clearTextScaleFactorTestValue();
  });

  Finder tab(String label) => find.descendant(
    of: find.byType(CivicTabBar),
    matching: find.text(label),
  );

  testWidgets('tab screens fit at 200% text', (tester) async {
    await pumpCivicApp(tester);
    expect(tester.takeException(), isNull, reason: 'Home');

    for (final label in ['Map', 'Act', 'Learn', 'You']) {
      await tester.tap(tab(label));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: label);
    }
  });

  testWidgets('tab labels stop growing at 1.3x', (tester) async {
    await pumpCivicApp(tester);
    final label = tester.element(tab('Home'));
    expect(MediaQuery.textScalerOf(label).scale(10), closeTo(13, 0.01));
  });

  testWidgets('pushed screens fit at 200% text', (tester) async {
    await pumpCivicApp(tester);

    await tester.tap(find.byTooltip('Notifications'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Notifications');

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Settings').first);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Settings');

    await tester.tap(find.text('Appearance'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Appearance');
  });
}
