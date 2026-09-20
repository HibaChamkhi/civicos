// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(issuesRepository)
final issuesRepositoryProvider = IssuesRepositoryProvider._();

final class IssuesRepositoryProvider
    extends
        $FunctionalProvider<
          IssuesRepository,
          IssuesRepository,
          IssuesRepository
        >
    with $Provider<IssuesRepository> {
  IssuesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'issuesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$issuesRepositoryHash();

  @$internal
  @override
  $ProviderElement<IssuesRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IssuesRepository create(Ref ref) {
    return issuesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IssuesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IssuesRepository>(value),
    );
  }
}

String _$issuesRepositoryHash() => r'35d7bde60b5bc697965d52e782ac31738311c4af';

@ProviderFor(nearbyIssues)
final nearbyIssuesProvider = NearbyIssuesProvider._();

final class NearbyIssuesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Issue>>,
          List<Issue>,
          FutureOr<List<Issue>>
        >
    with $FutureModifier<List<Issue>>, $FutureProvider<List<Issue>> {
  NearbyIssuesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nearbyIssuesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nearbyIssuesHash();

  @$internal
  @override
  $FutureProviderElement<List<Issue>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Issue>> create(Ref ref) {
    return nearbyIssues(ref);
  }
}

String _$nearbyIssuesHash() => r'd25afd26ab83e7cda7556a6a136d28be8f38461b';

/// Just the still-open ones, for "what needs attention near me".

@ProviderFor(openIssues)
final openIssuesProvider = OpenIssuesProvider._();

/// Just the still-open ones, for "what needs attention near me".

final class OpenIssuesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Issue>>,
          List<Issue>,
          FutureOr<List<Issue>>
        >
    with $FutureModifier<List<Issue>>, $FutureProvider<List<Issue>> {
  /// Just the still-open ones, for "what needs attention near me".
  OpenIssuesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openIssuesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openIssuesHash();

  @$internal
  @override
  $FutureProviderElement<List<Issue>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Issue>> create(Ref ref) {
    return openIssues(ref);
  }
}

String _$openIssuesHash() => r'de602521b014a45377de1c40db86267864921cb4';
