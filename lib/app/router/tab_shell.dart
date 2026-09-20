import 'dart:async';

import 'package:civicos/app/router/civic_tab_bar.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/preferences/haptics.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// The floating tab dock around the five tab branches. Each branch keeps
/// its own navigation stack and scroll position, and content scrolls
/// underneath the dock.
class TabShell extends ConsumerWidget {
  const TabShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _select(WidgetRef ref, int index) {
    if (index != navigationShell.currentIndex) {
      unawaited(selectionHaptic(ref));
    }
    // Tapping the current tab again returns it to its first screen.
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final onHome = navigationShell.currentIndex == 0;

    return PopScope(
      // Android back from another tab's root goes to Home before leaving.
      canPop: onHome,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && !onHome) navigationShell.goBranch(0);
      },
      child: Scaffold(
        extendBody: true,
        body: navigationShell,
        bottomNavigationBar: MediaQuery.withClampedTextScaling(
          maxScaleFactor: Sizes.tabLabelMaxTextScale,
          child: CivicTabBar(
            currentIndex: navigationShell.currentIndex,
            onSelected: (index) => _select(ref, index),
            items: [
              CivicTabItem(icon: LucideIcons.house, label: l10n.tabHome),
              CivicTabItem(icon: LucideIcons.map, label: l10n.tabMap),
              CivicTabItem(icon: LucideIcons.handHeart, label: l10n.tabAct),
              CivicTabItem(icon: LucideIcons.bookOpen, label: l10n.tabLearn),
              CivicTabItem(icon: LucideIcons.circleUser, label: l10n.tabYou),
            ],
          ),
        ),
      ),
    );
  }
}
