import 'package:civicos/core/storage/key_value_store.dart';

/// Test double for [KeyValueStore] that keeps values in a map.
class InMemoryKeyValueStore implements KeyValueStore {
  InMemoryKeyValueStore([Map<String, Object>? initial])
    : values = {...?initial};

  final Map<String, Object> values;

  @override
  String? getString(String key) => values[key] as String?;

  @override
  Future<void> setString(String key, String value) async {
    values[key] = value;
  }

  @override
  bool? getBool(String key) => values[key] as bool?;

  @override
  Future<void> setBool(String key, {required bool value}) async {
    values[key] = value;
  }
}
