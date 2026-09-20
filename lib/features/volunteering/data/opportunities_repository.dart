import 'package:civicos/core/preferences/app_locale.dart';
import 'package:civicos/core/sample/sample_data.dart';
import 'package:civicos/features/volunteering/domain/opportunity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'opportunities_repository.g.dart';

/// Reads volunteering opportunities.
abstract interface class OpportunitiesRepository {
  Future<List<Opportunity>> all();

  /// Best matches for the person's skills and interests, strongest first.
  Future<List<Opportunity>> matched({int limit});
}

class SampleOpportunitiesRepository implements OpportunitiesRepository {
  const SampleOpportunitiesRepository({this.arabic = false});

  /// Sample content ships in both languages; the server will return
  /// whatever language a neighbor wrote.
  final bool arabic;

  @override
  Future<List<Opportunity>> all() async {
    await Future<void>.delayed(SampleData.latency);
    final items = SampleData.opportunities(arabic: arabic)
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));
    return items;
  }

  @override
  Future<List<Opportunity>> matched({int limit = 10}) async {
    await Future<void>.delayed(SampleData.latency);
    final items =
        SampleData.opportunities(
            arabic: arabic,
          ).where((item) => !item.isFull).toList()
          ..sort((a, b) => b.matchScore.compareTo(a.matchScore));
    return items.take(limit).toList();
  }
}

@Riverpod(keepAlive: true)
OpportunitiesRepository opportunitiesRepository(Ref ref) =>
    SampleOpportunitiesRepository(arabic: ref.watch(isArabicProvider));

@riverpod
Future<List<Opportunity>> allOpportunities(Ref ref) =>
    ref.watch(opportunitiesRepositoryProvider).all();

@riverpod
Future<List<Opportunity>> matchedOpportunities(Ref ref) =>
    ref.watch(opportunitiesRepositoryProvider).matched();
