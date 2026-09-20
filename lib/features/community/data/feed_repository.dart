import 'package:civicos/core/preferences/app_locale.dart';
import 'package:civicos/core/sample/sample_data.dart';
import 'package:civicos/features/community/domain/feed_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_repository.g.dart';

/// Reads the community feed: real outcomes, newest first.
abstract interface class FeedRepository {
  Future<List<FeedItem>> latest({int limit});
}

class SampleFeedRepository implements FeedRepository {
  const SampleFeedRepository({this.arabic = false});

  /// Sample content ships in both languages; the server will return
  /// whatever language a neighbor wrote.
  final bool arabic;

  @override
  Future<List<FeedItem>> latest({int limit = 20}) async {
    await Future<void>.delayed(SampleData.latency);
    final items = SampleData.feed(arabic: arabic)
      ..sort((a, b) => b.happenedAt.compareTo(a.happenedAt));
    return items.take(limit).toList();
  }
}

@Riverpod(keepAlive: true)
FeedRepository feedRepository(Ref ref) =>
    SampleFeedRepository(arabic: ref.watch(isArabicProvider));

@riverpod
Future<List<FeedItem>> communityFeed(Ref ref) =>
    ref.watch(feedRepositoryProvider).latest();
