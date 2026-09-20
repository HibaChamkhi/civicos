/// Which backend and feature set a build talks to.
enum AppEnv {
  development,
  staging,
  production;

  bool get isDevelopment => this == AppEnv.development;
}

/// Build-time configuration passed with `--dart-define-from-file`.
///
/// These values are compiled into the app binary, so they must never be
/// secrets. Row Level Security is what protects data.
abstract final class Env {
  static const rawAppEnv = String.fromEnvironment('APP_ENV');

  /// Parses [raw] into an [AppEnv], or throws an [EnvException] whose
  /// message says exactly how to fix the build.
  static AppEnv parseAppEnv(String raw) {
    for (final env in AppEnv.values) {
      if (env.name == raw) return env;
    }
    final problem = raw.isEmpty ? 'is missing' : 'is invalid ("$raw")';
    throw EnvException(
      'APP_ENV $problem. Run the app with '
      '--dart-define-from-file=env/development.json '
      '(or staging.json / production.json).',
    );
  }
}

final class EnvException implements Exception {
  const EnvException(this.message);

  final String message;

  @override
  String toString() => 'EnvException: $message';
}
