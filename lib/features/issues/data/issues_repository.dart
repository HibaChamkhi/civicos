import 'package:civicos/core/preferences/app_locale.dart';
import 'package:civicos/core/sample/sample_data.dart';
import 'package:civicos/features/issues/domain/issue.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'issues_repository.g.dart';

/// Reads civic issues. Step 2 replaces the sample implementation with one
/// backed by Supabase; nothing above this layer changes.
abstract interface class IssuesRepository {
  /// Open issues around the person, closest first.
  Future<List<Issue>> nearby({int limit});

  Future<Issue?> byId(String id);
}

class SampleIssuesRepository implements IssuesRepository {
  const SampleIssuesRepository({this.arabic = false});

  /// Sample content ships in both languages; the server will return
  /// whatever language a neighbor wrote.
  final bool arabic;

  @override
  Future<List<Issue>> nearby({int limit = 20}) async {
    await Future<void>.delayed(SampleData.latency);
    final issues = SampleData.issues(arabic: arabic)
      ..sort((a, b) => a.distanceMeters.compareTo(b.distanceMeters));
    return issues.take(limit).toList();
  }

  @override
  Future<Issue?> byId(String id) async {
    await Future<void>.delayed(SampleData.latency);
    for (final issue in SampleData.issues(arabic: arabic)) {
      if (issue.id == id) return issue;
    }
    return null;
  }
}

@Riverpod(keepAlive: true)
IssuesRepository issuesRepository(Ref ref) =>
    SampleIssuesRepository(arabic: ref.watch(isArabicProvider));

@riverpod
Future<List<Issue>> nearbyIssues(Ref ref) =>
    ref.watch(issuesRepositoryProvider).nearby();

/// Just the still-open ones, for "what needs attention near me".
@riverpod
Future<List<Issue>> openIssues(Ref ref) async {
  final issues = await ref.watch(nearbyIssuesProvider.future);
  return issues.where((issue) => issue.status.isOpen).toList();
}
