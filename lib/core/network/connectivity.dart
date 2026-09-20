import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity.g.dart';

/// Whether any network interface is up.
///
/// This can't prove the internet is reachable (a captive portal still counts
/// as "online"), so the data layer also treats failed requests as offline.
@Riverpod(keepAlive: true)
Stream<bool> isOnline(Ref ref) async* {
  final connectivity = Connectivity();
  yield hasConnection(await connectivity.checkConnectivity());
  yield* connectivity.onConnectivityChanged.map(hasConnection).distinct();
}

bool hasConnection(List<ConnectivityResult> results) {
  return results.any((result) => result != ConnectivityResult.none);
}
