import 'package:civicos/core/env/env.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_env_provider.g.dart';

/// The parsed `APP_ENV`. Overridden in `main()` after validation, which
/// keeps widgets free of compile-time globals and easy to test.
@Riverpod(keepAlive: true)
AppEnv appEnv(Ref ref) {
  throw StateError(
    'appEnvProvider must be overridden in the root ProviderScope.',
  );
}
