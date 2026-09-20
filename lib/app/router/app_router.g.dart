// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The app's single router. Step 2 adds the sign-in redirect here.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// The app's single router. Step 2 adds the sign-in redirect here.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// The app's single router. Step 2 adds the sign-in redirect here.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'4b6a2b95a319143fbf5a499d1f5ee24732cf52b8';
