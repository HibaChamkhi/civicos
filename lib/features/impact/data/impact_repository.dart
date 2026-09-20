import 'package:civicos/core/preferences/app_locale.dart';
import 'package:civicos/core/sample/sample_data.dart';
import 'package:civicos/features/impact/domain/impact_summary.dart';
import 'package:civicos/features/profile/domain/profile_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'impact_repository.g.dart';

/// Reads the person's profile and impact totals. Totals are computed by the
/// server from the impact ledger, never counted on the device.
abstract interface class ImpactRepository {
  Future<ProfileSummary> profile();

  Future<ImpactSummary> summary();
}

class SampleImpactRepository implements ImpactRepository {
  const SampleImpactRepository({this.arabic = false});

  /// Sample content ships in both languages; the server will return
  /// whatever language a neighbor wrote.
  final bool arabic;

  @override
  Future<ProfileSummary> profile() async {
    await Future<void>.delayed(SampleData.latency);
    return SampleData.profile(arabic: arabic);
  }

  @override
  Future<ImpactSummary> summary() async {
    await Future<void>.delayed(SampleData.latency);
    return SampleData.impact(arabic: arabic);
  }
}

@Riverpod(keepAlive: true)
ImpactRepository impactRepository(Ref ref) =>
    SampleImpactRepository(arabic: ref.watch(isArabicProvider));

@riverpod
Future<ProfileSummary> profileSummary(Ref ref) =>
    ref.watch(impactRepositoryProvider).profile();

@riverpod
Future<ImpactSummary> impactSummary(Ref ref) =>
    ref.watch(impactRepositoryProvider).summary();
