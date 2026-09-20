// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_env_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The parsed `APP_ENV`. Overridden in `main()` after validation, which
/// keeps widgets free of compile-time globals and easy to test.

@ProviderFor(appEnv)
final appEnvProvider = AppEnvProvider._();

/// The parsed `APP_ENV`. Overridden in `main()` after validation, which
/// keeps widgets free of compile-time globals and easy to test.

final class AppEnvProvider extends $FunctionalProvider<AppEnv, AppEnv, AppEnv>
    with $Provider<AppEnv> {
  /// The parsed `APP_ENV`. Overridden in `main()` after validation, which
  /// keeps widgets free of compile-time globals and easy to test.
  AppEnvProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appEnvProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appEnvHash();

  @$internal
  @override
  $ProviderElement<AppEnv> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppEnv create(Ref ref) {
    return appEnv(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppEnv value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppEnv>(value),
    );
  }
}

String _$appEnvHash() => r'259187ddc09b993fe17f6a65c470ec12ab2a81d7';
