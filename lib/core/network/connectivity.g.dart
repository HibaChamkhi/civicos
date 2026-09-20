// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether any network interface is up.
///
/// This can't prove the internet is reachable (a captive portal still counts
/// as "online"), so the data layer also treats failed requests as offline.

@ProviderFor(isOnline)
final isOnlineProvider = IsOnlineProvider._();

/// Whether any network interface is up.
///
/// This can't prove the internet is reachable (a captive portal still counts
/// as "online"), so the data layer also treats failed requests as offline.

final class IsOnlineProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Whether any network interface is up.
  ///
  /// This can't prove the internet is reachable (a captive portal still counts
  /// as "online"), so the data layer also treats failed requests as offline.
  IsOnlineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isOnlineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isOnlineHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isOnline(ref);
  }
}

String _$isOnlineHash() => r'c1cfa3c9669027b97cba80dcbc887eb78c496175';
