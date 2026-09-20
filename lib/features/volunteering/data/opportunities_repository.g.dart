// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunities_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(opportunitiesRepository)
final opportunitiesRepositoryProvider = OpportunitiesRepositoryProvider._();

final class OpportunitiesRepositoryProvider
    extends
        $FunctionalProvider<
          OpportunitiesRepository,
          OpportunitiesRepository,
          OpportunitiesRepository
        >
    with $Provider<OpportunitiesRepository> {
  OpportunitiesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'opportunitiesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$opportunitiesRepositoryHash();

  @$internal
  @override
  $ProviderElement<OpportunitiesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OpportunitiesRepository create(Ref ref) {
    return opportunitiesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpportunitiesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpportunitiesRepository>(value),
    );
  }
}

String _$opportunitiesRepositoryHash() =>
    r'c34163baae939fbfc4dde9c26953bef395713ba7';

@ProviderFor(allOpportunities)
final allOpportunitiesProvider = AllOpportunitiesProvider._();

final class AllOpportunitiesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Opportunity>>,
          List<Opportunity>,
          FutureOr<List<Opportunity>>
        >
    with
        $FutureModifier<List<Opportunity>>,
        $FutureProvider<List<Opportunity>> {
  AllOpportunitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allOpportunitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allOpportunitiesHash();

  @$internal
  @override
  $FutureProviderElement<List<Opportunity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Opportunity>> create(Ref ref) {
    return allOpportunities(ref);
  }
}

String _$allOpportunitiesHash() => r'a3db14c7c9ca089f3fda7ef9fd49ee7bab2192d2';

@ProviderFor(matchedOpportunities)
final matchedOpportunitiesProvider = MatchedOpportunitiesProvider._();

final class MatchedOpportunitiesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Opportunity>>,
          List<Opportunity>,
          FutureOr<List<Opportunity>>
        >
    with
        $FutureModifier<List<Opportunity>>,
        $FutureProvider<List<Opportunity>> {
  MatchedOpportunitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchedOpportunitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchedOpportunitiesHash();

  @$internal
  @override
  $FutureProviderElement<List<Opportunity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Opportunity>> create(Ref ref) {
    return matchedOpportunities(ref);
  }
}

String _$matchedOpportunitiesHash() =>
    r'e72b1e2c262e7f10c71850265ac4622a81bc96bc';
