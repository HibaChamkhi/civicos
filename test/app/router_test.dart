import 'package:civicos/app/app.dart';
import 'package:civicos/app/router/app_router.dart';
import 'package:civicos/app/router/civic_tab_bar.dart';
import 'package:civicos/core/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

/// A heading that only Home shows.
const _homeSection = 'Open near you';

Finder _tab(String label) => find.descendant(
  of: find.byType(CivicTabBar),
  matching: find.text(label),
);

void main() {
  testWidgets('starts on Home with five labeled tabs', (tester) async {
    await pumpCivicApp(tester);

    for (final label in ['Home', 'Map', 'Act', 'Learn', 'You']) {
      expect(_tab(label), findsOneWidget);
    }
    expect(find.text(_homeSection), findsOneWidget);
  });

  testWidgets('each tab shows its own screen', (tester) async {
    await pumpCivicApp(tester);

    final expectations = {
      'Map': 'Showing the list. The map itself arrives with location support.',
      'Act': 'For you',
      'Learn': 'All lessons',
      'You': 'Amine Ben Salah',
      'Home': _homeSection,
    };
    for (final MapEntry(key: tab, value: marker) in expectations.entries) {
      await tester.tap(_tab(tab));
      await tester.pumpAndSettle();
      expect(find.text(marker), findsWidgets, reason: 'on the $tab tab');
    }
  });

  testWidgets('a section action moves to the matching tab', (tester) async {
    await pumpCivicApp(tester);

    // "See all" under "Open near you" goes to the Map tab.
    await tester.tap(find.text('See all').first);
    await tester.pumpAndSettle();
    expect(find.text('Illegal dumping behind the market'), findsOneWidget);
  });

  testWidgets('the bell opens notifications, which leads back Home', (
    tester,
  ) async {
    await pumpCivicApp(tester);

    await tester.tap(find.byTooltip('Notifications'));
    await tester.pumpAndSettle();
    expect(find.text("You're all caught up"), findsOneWidget);

    await tester.tap(find.text('Back to Home'));
    await tester.pumpAndSettle();
    expect(find.text(_homeSection), findsOneWidget);
  });

  testWidgets('choosing Dark in Appearance switches the theme', (
    tester,
  ) async {
    await pumpCivicApp(tester);

    await tester.tap(find.byTooltip('Settings').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Appearance'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);
  });

  testWidgets('the design system gallery is hidden outside development', (
    tester,
  ) async {
    await pumpCivicApp(tester, env: AppEnv.production);

    await tester.tap(find.byTooltip('Settings').first);
    await tester.pumpAndSettle();
    expect(find.text('Design system'), findsNothing);
  });

  testWidgets('an unknown deep link shows a way back', (tester) async {
    await pumpCivicApp(tester);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(CivicApp)),
    );

    container.read(appRouterProvider).go('/definitely-not-a-page');
    await tester.pumpAndSettle();
    expect(find.text("This page doesn't exist"), findsOneWidget);

    await tester.tap(find.text('Go to Home'));
    await tester.pumpAndSettle();
    expect(find.text(_homeSection), findsOneWidget);
  });

  testWidgets('shows the offline banner when there is no network', (
    tester,
  ) async {
    await pumpCivicApp(tester, online: false);

    expect(
      find.text(
        "You're offline. You can keep browsing what's already loaded.",
      ),
      findsOneWidget,
    );
  });
}
