import 'package:civicos/app/router/routes.dart';
import 'package:civicos/features/settings/presentation/not_found_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// The app's single router. Step 2 adds the sign-in redirect here.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    initialLocation: const HomeRoute().location,
    routes: $appRoutes,
    redirect: (context, state) =>
        state.uri.path == '/' ? const HomeRoute().location : null,
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
  ref.onDispose(router.dispose);
  return router;
}
