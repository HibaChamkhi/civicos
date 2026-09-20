// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(feedRepository)
final feedRepositoryProvider = FeedRepositoryProvider._();

final class FeedRepositoryProvider
    extends $FunctionalProvider<FeedRepository, FeedRepository, FeedRepository>
    with $Provider<FeedRepository> {
  FeedRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedRepositoryHash();

  @$internal
  @override
  $ProviderElement<FeedRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FeedRepository create(Ref ref) {
    return feedRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedRepository>(value),
    );
  }
}

String _$feedRepositoryHash() => r'84da6d5811728dfb753600557c693a825abd5682';

@ProviderFor(communityFeed)
final communityFeedProvider = CommunityFeedProvider._();

final class CommunityFeedProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FeedItem>>,
          List<FeedItem>,
          FutureOr<List<FeedItem>>
        >
    with $FutureModifier<List<FeedItem>>, $FutureProvider<List<FeedItem>> {
  CommunityFeedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityFeedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityFeedHash();

  @$internal
  @override
  $FutureProviderElement<List<FeedItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<FeedItem>> create(Ref ref) {
    return communityFeed(ref);
  }
}

String _$communityFeedHash() => r'6c1fe6de2c0f42e61097c786dc608c5734a1b728';
