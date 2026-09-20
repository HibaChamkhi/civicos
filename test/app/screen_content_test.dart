import 'package:civicos/app/router/civic_tab_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

Finder _tabNamed(String label) => find.descendant(
  of: find.byType(CivicTabBar),
  matching: find.text(label),
);

/// Scrolls down until [text] is on screen, then checks it is there.
/// Screens build their content lazily, so anything below the fold has to be
/// scrolled to first.
Future<void> _expectVisible(WidgetTester tester, String text) async {
  final finder = find.text(text);
  if (finder.evaluate().isEmpty) {
    await tester.scrollUntilVisible(finder, 250);
    await tester.pumpAndSettle();
  }
  expect(finder, findsWidgets, reason: 'expected "$text" on screen');
}

Future<void> _openTab(WidgetTester tester, String label) async {
  await tester.tap(_tabNamed(label));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Home shows the week, nearby issues and skill matches', (
    tester,
  ) async {
    await pumpCivicApp(tester);

    // The content is labelled as sample data.
    expect(find.textContaining('Sample content'), findsOneWidget);
    // This week's hours and level.
    expect(find.text('4.5'), findsOneWidget);
    expect(find.text('Level 3 · Community Helper'), findsOneWidget);
    // The closest open issue, with its status.
    await _expectVisible(tester, 'Streetlight out on Rue des Oliviers');
    await _expectVisible(tester, 'In progress');
    // The strongest skill match, with the reason why.
    await _expectVisible(tester, 'Build a website for a youth club');
    await _expectVisible(tester, '94% match');
    await _expectVisible(tester, 'You have Flutter and Graphic design');
    // A community outcome in the feed.
    await _expectVisible(
      tester,
      'The community got the water leak near the school gate fixed',
    );
  });

  testWidgets('Home counts the open issues near you', (tester) async {
    await pumpCivicApp(tester);
    expect(find.text('4 issues are open near you'), findsOneWidget);
  });

  testWidgets('the Map tab lists issues, opportunities and events', (
    tester,
  ) async {
    await pumpCivicApp(tester);
    await _openTab(tester, 'Map');

    await _expectVisible(tester, 'Illegal dumping behind the market');
    await _expectVisible(tester, 'Neighborhood clean-up day');

    // Filtering to events only leaves the issues out.
    await _openTab(tester, 'Map');
    await tester.tap(find.text('Events'));
    await tester.pumpAndSettle();
    expect(find.text('Illegal dumping behind the market'), findsNothing);
    await _expectVisible(tester, 'Neighborhood clean-up day');
  });

  testWidgets('the Act tab switches between matches, missions and events', (
    tester,
  ) async {
    await pumpCivicApp(tester);
    await _openTab(tester, 'Act');
    await _expectVisible(tester, 'Build a website for a youth club');

    await tester.tap(find.text('Missions'));
    await tester.pumpAndSettle();
    await _expectVisible(tester, 'Clean Streets');
    await _expectVisible(tester, '1 of 3 objectives done');
    await _expectVisible(tester, '+150 XP');

    await tester.tap(find.text('Events'));
    await tester.pumpAndSettle();
    await _expectVisible(tester, 'Blood donation drive');
  });

  testWidgets('the Learn tab offers the lesson in progress first', (
    tester,
  ) async {
    await pumpCivicApp(tester);
    await _openTab(tester, 'Learn');

    expect(find.text('Pick up where you left off'), findsOneWidget);
    expect(
      find.text('First aid: the first three minutes'),
      findsWidgets,
    );
    await _expectVisible(tester, 'Spot a water leak early');
    await _expectVisible(tester, 'Passed');
  });

  testWidgets('the You tab shows the profile, stats and badges', (
    tester,
  ) async {
    await pumpCivicApp(tester);
    await _openTab(tester, 'You');

    expect(find.text('Amine Ben Salah'), findsOneWidget);
    expect(find.text('El Menzah · Tunis'), findsOneWidget);
    expect(find.text('Trust 78 of 100'), findsOneWidget);

    await _expectVisible(tester, 'Issues reported');
    await _expectVisible(tester, 'Problem solver');
  });
}
