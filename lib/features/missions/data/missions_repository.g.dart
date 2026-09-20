// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(missionsRepository)
final missionsRepositoryProvider = MissionsRepositoryProvider._();

final class MissionsRepositoryProvider
    extends
        $FunctionalProvider<
          MissionsRepository,
          MissionsRepository,
          MissionsRepository
        >
    with $Provider<MissionsRepository> {
  MissionsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'missionsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$missionsRepositoryHash();

  @$internal
  @override
  $ProviderElement<MissionsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MissionsRepository create(Ref ref) {
    return missionsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MissionsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MissionsRepository>(value),
    );
  }
}

String _$missionsRepositoryHash() =>
    r'6fb8d6470107b2f1adfd4425b9aaf0f0839f6a10';

@ProviderFor(activeMissions)
final activeMissionsProvider = ActiveMissionsProvider._();

final class ActiveMissionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Mission>>,
          List<Mission>,
          FutureOr<List<Mission>>
        >
    with $FutureModifier<List<Mission>>, $FutureProvider<List<Mission>> {
  ActiveMissionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeMissionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeMissionsHash();

  @$internal
  @override
  $FutureProviderElement<List<Mission>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Mission>> create(Ref ref) {
    return activeMissions(ref);
  }
}

String _$activeMissionsHash() => r'e6ef7705506b7d44442225599c6d731dc3d352ee';
