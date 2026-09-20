import 'package:civicos/app/router/civic_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../helpers/pump_app.dart';

const _items = [
  CivicTabItem(icon: LucideIcons.house, label: 'Home'),
  CivicTabItem(icon: LucideIcons.map, label: 'Map'),
  CivicTabItem(icon: LucideIcons.handHeart, label: 'Act'),
];

void main() {
  testWidgets('announces each tab with its position and selection', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();
    await pumpThemed(
      tester,
      CivicTabBar(items: _items, currentIndex: 1, onSelected: (_) {}),
    );

    expect(
      tester.getSemantics(find.bySemanticsLabel('Map, Tab 2 of 3')),
      isSemantics(isButton: true, isSelected: true),
    );
    expect(
      tester.getSemantics(find.bySemanticsLabel('Home, Tab 1 of 3')),
      isSemantics(isButton: true, isSelected: false),
    );
    semantics.dispose();
  });

  testWidgets('reports which tab was tapped', (tester) async {
    int? tapped;
    await pumpThemed(
      tester,
      CivicTabBar(
        items: _items,
        currentIndex: 0,
        onSelected: (index) => tapped = index,
      ),
    );

    await tester.tap(find.text('Act'));
    expect(tapped, 2);
  });

  testWidgets('every tab is at least 48dp tall', (tester) async {
    await pumpThemed(
      tester,
      CivicTabBar(items: _items, currentIndex: 0, onSelected: (_) {}),
    );

    for (final item in _items) {
      final slot = find.ancestor(
        of: find.text(item.label),
        matching: find.byType(InkResponse),
      );
      expect(tester.getSize(slot).height, greaterThanOrEqualTo(48));
    }
  });
}
