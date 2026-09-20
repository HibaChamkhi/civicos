// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_value_store_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The preferences store. `main()` loads it before the first frame and
/// overrides this provider, so reads are synchronous everywhere.

@ProviderFor(keyValueStore)
final keyValueStoreProvider = KeyValueStoreProvider._();

/// The preferences store. `main()` loads it before the first frame and
/// overrides this provider, so reads are synchronous everywhere.

final class KeyValueStoreProvider
    extends $FunctionalProvider<KeyValueStore, KeyValueStore, KeyValueStore>
    with $Provider<KeyValueStore> {
  /// The preferences store. `main()` loads it before the first frame and
  /// overrides this provider, so reads are synchronous everywhere.
  KeyValueStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyValueStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyValueStoreHash();

  @$internal
  @override
  $ProviderElement<KeyValueStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  KeyValueStore create(Ref ref) {
    return keyValueStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeyValueStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeyValueStore>(value),
    );
  }
}

String _$keyValueStoreHash() => r'964080a0ed60f9ab6d4f40f93c4b0beaa34b8870';
