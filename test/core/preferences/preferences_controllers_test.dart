import 'package:civicos/core/preferences/preferences_controllers.dart';
import 'package:civicos/core/preferences/theme_preference.dart';
import 'package:civicos/core/storage/key_value_store.dart';
import 'package:civicos/core/storage/key_value_store_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/in_memory_key_value_store.dart';

ProviderContainer _container(InMemoryKeyValueStore store) {
  final container = ProviderContainer(
    overrides: [keyValueStoreProvider.overrideWithValue(store)],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('ThemePreferenceController', () {
    test('follows the phone by default', () {
      final container = _container(InMemoryKeyValueStore());
      expect(
        container.read(themePreferenceControllerProvider),
        ThemePreference.system,
      );
    });

    test('ignores an unrecognized stored value', () {
      final container = _container(
        InMemoryKeyValueStore({PreferenceKeys.themePreference: 'sepia'}),
      );
      expect(
        container.read(themePreferenceControllerProvider),
        ThemePreference.system,
      );
    });

    test('persists a choice across launches', () async {
      final store = InMemoryKeyValueStore();
      await _container(store)
          .read(themePreferenceControllerProvider.notifier)
          .select(ThemePreference.dark);

      expect(store.values[PreferenceKeys.themePreference], 'dark');
      expect(
        _container(store).read(themePreferenceControllerProvider),
        ThemePreference.dark,
      );
    });
  });

  group('HapticsController', () {
    test('is on by default', () {
      expect(
        _container(InMemoryKeyValueStore()).read(hapticsControllerProvider),
        isTrue,
      );
    });

    test('persists turning haptics off', () async {
      final store = InMemoryKeyValueStore();
      final container = _container(store);
      await container
          .read(hapticsControllerProvider.notifier)
          .setEnabled(enabled: false);

      expect(container.read(hapticsControllerProvider), isFalse);
      expect(store.values[PreferenceKeys.hapticsEnabled], isFalse);
    });
  });
}
