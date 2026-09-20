import 'package:civicos/core/storage/key_value_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'key_value_store_provider.g.dart';

/// The preferences store. `main()` loads it before the first frame and
/// overrides this provider, so reads are synchronous everywhere.
@Riverpod(keepAlive: true)
KeyValueStore keyValueStore(Ref ref) {
  throw StateError(
    'keyValueStoreProvider must be overridden in the root ProviderScope.',
  );
}
