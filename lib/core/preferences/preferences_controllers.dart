import 'package:civicos/core/preferences/app_language.dart';
import 'package:civicos/core/preferences/comfort_settings.dart';
import 'package:civicos/core/preferences/theme_preference.dart';
import 'package:civicos/core/storage/key_value_store.dart';
import 'package:civicos/core/storage/key_value_store_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preferences_controllers.g.dart';

/// Theme choice, persisted across launches.
@Riverpod(keepAlive: true)
class ThemePreferenceController extends _$ThemePreferenceController {
  @override
  ThemePreference build() {
    final stored = ref
        .watch(keyValueStoreProvider)
        .getString(PreferenceKeys.themePreference);
    return ThemePreference.fromStorage(stored);
  }

  Future<void> select(ThemePreference preference) async {
    if (preference == state) return;
    state = preference;
    await ref
        .read(keyValueStoreProvider)
        .setString(PreferenceKeys.themePreference, preference.name);
  }
}

/// Whether light haptic confirmations are on. Defaults to on.
@Riverpod(keepAlive: true)
class HapticsController extends _$HapticsController {
  @override
  bool build() {
    return ref
            .watch(keyValueStoreProvider)
            .getBool(PreferenceKeys.hapticsEnabled) ??
        true;
  }

  Future<void> setEnabled({required bool enabled}) async {
    if (enabled == state) return;
    state = enabled;
    await ref
        .read(keyValueStoreProvider)
        .setBool(PreferenceKeys.hapticsEnabled, value: enabled);
  }
}

/// Text size, reading font and calm mode, persisted across launches.
@Riverpod(keepAlive: true)
class ComfortController extends _$ComfortController {
  @override
  ComfortSettings build() {
    final store = ref.watch(keyValueStoreProvider);
    return ComfortSettings(
      textSize: TextSizeStep.fromStorage(
        store.getString(PreferenceKeys.textSize),
      ),
      font: ReadingFont.fromStorage(
        store.getString(PreferenceKeys.readingFont),
      ),
      calmMode: store.getBool(PreferenceKeys.calmMode) ?? false,
    );
  }

  Future<void> setTextSize(TextSizeStep step) async {
    if (step == state.textSize) return;
    state = state.copyWith(textSize: step);
    await ref
        .read(keyValueStoreProvider)
        .setString(PreferenceKeys.textSize, step.name);
  }

  Future<void> setFont(ReadingFont font) async {
    if (font == state.font) return;
    state = state.copyWith(font: font);
    await ref
        .read(keyValueStoreProvider)
        .setString(PreferenceKeys.readingFont, font.name);
  }

  Future<void> setCalmMode({required bool enabled}) async {
    if (enabled == state.calmMode) return;
    state = state.copyWith(calmMode: enabled);
    await ref
        .read(keyValueStoreProvider)
        .setBool(PreferenceKeys.calmMode, value: enabled);
  }

  Future<void> reset() async {
    const defaults = ComfortSettings();
    state = defaults;
    final store = ref.read(keyValueStoreProvider);
    await store.setString(PreferenceKeys.textSize, defaults.textSize.name);
    await store.setString(PreferenceKeys.readingFont, defaults.font.name);
    await store.setBool(PreferenceKeys.calmMode, value: defaults.calmMode);
  }
}

/// Language choice, persisted across launches.
@Riverpod(keepAlive: true)
class LanguageController extends _$LanguageController {
  @override
  AppLanguage build() {
    final stored = ref
        .watch(keyValueStoreProvider)
        .getString(PreferenceKeys.language);
    return AppLanguage.fromStorage(stored);
  }

  Future<void> select(AppLanguage language) async {
    if (language == state) return;
    state = language;
    await ref
        .read(keyValueStoreProvider)
        .setString(PreferenceKeys.language, language.name);
  }
}
