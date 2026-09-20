// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(impactRepository)
final impactRepositoryProvider = ImpactRepositoryProvider._();

final class ImpactRepositoryProvider
    extends
        $FunctionalProvider<
          ImpactRepository,
          ImpactRepository,
          ImpactRepository
        >
    with $Provider<ImpactRepository> {
  ImpactRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'impactRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$impactRepositoryHash();

  @$internal
  @override
  $ProviderElement<ImpactRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ImpactRepository create(Ref ref) {
    return impactRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImpactRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImpactRepository>(value),
    );
  }
}

String _$impactRepositoryHash() => r'670a93a0f0236841805e0ad3606eef69344dd11c';

@ProviderFor(profileSummary)
final profileSummaryProvider = ProfileSummaryProvider._();

final class ProfileSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfileSummary>,
          ProfileSummary,
          FutureOr<ProfileSummary>
        >
    with $FutureModifier<ProfileSummary>, $FutureProvider<ProfileSummary> {
  ProfileSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileSummaryHash();

  @$internal
  @override
  $FutureProviderElement<ProfileSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProfileSummary> create(Ref ref) {
    return profileSummary(ref);
  }
}

String _$profileSummaryHash() => r'96598bcc710adde3d50a90d922dd565a4d0b73a7';

@ProviderFor(impactSummary)
final impactSummaryProvider = ImpactSummaryProvider._();

final class ImpactSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ImpactSummary>,
          ImpactSummary,
          FutureOr<ImpactSummary>
        >
    with $FutureModifier<ImpactSummary>, $FutureProvider<ImpactSummary> {
  ImpactSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'impactSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$impactSummaryHash();

  @$internal
  @override
  $FutureProviderElement<ImpactSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ImpactSummary> create(Ref ref) {
    return impactSummary(ref);
  }
}

String _$impactSummaryHash() => r'aee1777d30fa9ad8e5f71d6f75dac4a43ee3168e';
