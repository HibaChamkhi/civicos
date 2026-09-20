import 'package:civicos/app/router/tab_shell.dart';
import 'package:civicos/features/act/presentation/act_screen.dart';
import 'package:civicos/features/home/presentation/home_screen.dart';
import 'package:civicos/features/learn/presentation/learn_screen.dart';
import 'package:civicos/features/map/presentation/map_screen.dart';
import 'package:civicos/features/notifications/presentation/notifications_screen.dart';
import 'package:civicos/features/settings/presentation/appearance_screen.dart';
import 'package:civicos/features/settings/presentation/comfort_screen.dart';
import 'package:civicos/features/settings/presentation/design_system_screen.dart';
import 'package:civicos/features/settings/presentation/language_screen.dart';
import 'package:civicos/features/settings/presentation/settings_screen.dart';
import 'package:civicos/features/you/presentation/you_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

// Typed routes: `const MapRoute().go(context)` instead of hand-built strings.
// Screens reached from a tab but listed outside the shell (notifications,
// settings) are pushed over the tab bar.

@TypedStatefulShellRoute<AppShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranch>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<HomeRoute>(path: '/home')],
    ),
    TypedStatefulShellBranch<MapBranch>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<MapRoute>(path: '/map')],
    ),
    TypedStatefulShellBranch<ActBranch>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<ActRoute>(path: '/act')],
    ),
    TypedStatefulShellBranch<LearnBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<LearnRoute>(path: '/learn'),
      ],
    ),
    TypedStatefulShellBranch<YouBranch>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<YouRoute>(path: '/you')],
    ),
  ],
)
class AppShellRoute extends StatefulShellRouteData {
  const AppShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return TabShell(navigationShell: navigationShell);
  }
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();
}

class MapBranch extends StatefulShellBranchData {
  const MapBranch();
}

class ActBranch extends StatefulShellBranchData {
  const ActBranch();
}

class LearnBranch extends StatefulShellBranchData {
  const LearnBranch();
}

class YouBranch extends StatefulShellBranchData {
  const YouBranch();
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class MapRoute extends GoRouteData with $MapRoute {
  const MapRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MapScreen();
  }
}

class ActRoute extends GoRouteData with $ActRoute {
  const ActRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ActScreen();
  }
}

class LearnRoute extends GoRouteData with $LearnRoute {
  const LearnRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LearnScreen();
  }
}

class YouRoute extends GoRouteData with $YouRoute {
  const YouRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const YouScreen();
  }
}

@TypedGoRoute<NotificationsRoute>(path: '/notifications')
class NotificationsRoute extends GoRouteData with $NotificationsRoute {
  const NotificationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationsScreen();
  }
}

@TypedGoRoute<SettingsRoute>(
  path: '/settings',
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AppearanceRoute>(path: 'appearance'),
    TypedGoRoute<ComfortRoute>(path: 'comfort'),
    TypedGoRoute<LanguageRoute>(path: 'language'),
    TypedGoRoute<DesignSystemRoute>(path: 'design-system'),
  ],
)
class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}

class AppearanceRoute extends GoRouteData with $AppearanceRoute {
  const AppearanceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppearanceScreen();
  }
}

class ComfortRoute extends GoRouteData with $ComfortRoute {
  const ComfortRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ComfortScreen();
  }
}

/// Only renders in development builds; elsewhere it shows "not found".
class DesignSystemRoute extends GoRouteData with $DesignSystemRoute {
  const DesignSystemRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DesignSystemScreen();
  }
}

class LanguageRoute extends GoRouteData with $LanguageRoute {
  const LanguageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LanguageScreen();
  }
}
