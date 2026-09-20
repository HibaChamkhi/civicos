import 'package:civicos/core/preferences/app_locale.dart';
import 'package:civicos/core/sample/sample_data.dart';
import 'package:civicos/features/missions/domain/mission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'missions_repository.g.dart';

/// Reads community missions.
abstract interface class MissionsRepository {
  /// Missions still running, the ones you joined first.
  Future<List<Mission>> active();
}

class SampleMissionsRepository implements MissionsRepository {
  const SampleMissionsRepository({this.arabic = false});

  /// Sample content ships in both languages; the server will return
  /// whatever language a neighbor wrote.
  final bool arabic;

  @override
  Future<List<Mission>> active() async {
    await Future<void>.delayed(SampleData.latency);
    final missions = SampleData.missions(arabic: arabic)
      ..sort((a, b) {
        if (a.joined != b.joined) return a.joined ? -1 : 1;
        return a.endsAt.compareTo(b.endsAt);
      });
    return missions;
  }
}

@Riverpod(keepAlive: true)
MissionsRepository missionsRepository(Ref ref) =>
    SampleMissionsRepository(arabic: ref.watch(isArabicProvider));

@riverpod
Future<List<Mission>> activeMissions(Ref ref) =>
    ref.watch(missionsRepositoryProvider).active();
