import 'package:shared_preferences/shared_preferences.dart';

/// Small synchronous-read store for non-sensitive device preferences.
/// Secrets (the auth session) go to secure storage instead.
abstract interface class KeyValueStore {
  String? getString(String key);

  Future<void> setString(String key, String value);

  bool? getBool(String key);

  Future<void> setBool(String key, {required bool value});
}

abstract final class PreferenceKeys {
  static const themePreference = 'theme_preference';
  static const hapticsEnabled = 'haptics_enabled';
  static const textSize = 'comfort_text_size';
  static const readingFont = 'comfort_reading_font';
  static const calmMode = 'comfort_calm_mode';
  static const language = 'app_language';

  static const all = <String>{
    themePreference,
    hapticsEnabled,
    textSize,
    readingFont,
    calmMode,
    language,
  };
}

/// [KeyValueStore] backed by `SharedPreferencesWithCache`, which loads the
/// allow-listed keys once at startup so reads never await.
final class SharedPreferencesKeyValueStore implements KeyValueStore {
  SharedPreferencesKeyValueStore._(this._prefs);

  static Future<SharedPreferencesKeyValueStore> create() async {
    final prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: PreferenceKeys.all,
      ),
    );
    return SharedPreferencesKeyValueStore._(prefs);
  }

  final SharedPreferencesWithCache _prefs;

  @override
  String? getString(String key) => _prefs.getString(key);

  @override
  Future<void> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  @override
  bool? getBool(String key) => _prefs.getBool(key);

  @override
  Future<void> setBool(String key, {required bool value}) {
    return _prefs.setBool(key, value);
  }
}
