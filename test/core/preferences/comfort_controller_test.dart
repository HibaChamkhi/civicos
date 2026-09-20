import 'package:civicos/core/preferences/comfort_settings.dart';
import 'package:civicos/core/preferences/preferences_controllers.dart';
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
  group('TextSizeStep', () {
    test('grows from small to largest, with default at 100%', () {
      final factors = TextSizeStep.values.map((s) => s.factor).toList();
      expect(factors, orderedEquals([...factors]..sort()));
      expect(TextSizeStep.standard.factor, 1);
    });

    test('falls back to default for unknown stored values', () {
      expect(TextSizeStep.fromStorage('huge'), TextSizeStep.standard);
      expect(TextSizeStep.fromStorage(null), TextSizeStep.standard);
      expect(TextSizeStep.fromStorage('larger'), TextSizeStep.larger);
    });
  });

  group('ComfortController', () {
    test('starts at defaults', () {
      final settings = _container(
        InMemoryKeyValueStore(),
      ).read(comfortControllerProvider);
      expect(settings.isDefault, isTrue);
    });

    test('reads what was saved', () {
      final settings = _container(
        InMemoryKeyValueStore({
          PreferenceKeys.textSize: 'largest',
          PreferenceKeys.readingFont: 'hyperlegible',
          PreferenceKeys.calmMode: true,
        }),
      ).read(comfortControllerProvider);

      expect(settings.textSize, TextSizeStep.largest);
      expect(settings.font, ReadingFont.hyperlegible);
      expect(settings.calmMode, isTrue);
      expect(settings.isDefault, isFalse);
    });

    test('persists each change', () async {
      final store = InMemoryKeyValueStore();
      final controller = _container(
        store,
      ).read(comfortControllerProvider.notifier);

      await controller.setTextSize(TextSizeStep.large);
      await controller.setFont(ReadingFont.hyperlegible);
      await controller.setCalmMode(enabled: true);

      expect(store.values[PreferenceKeys.textSize], 'large');
      expect(store.values[PreferenceKeys.readingFont], 'hyperlegible');
      expect(store.values[PreferenceKeys.calmMode], isTrue);
      expect(
        _container(store).read(comfortControllerProvider),
        const ComfortSettings(
          textSize: TextSizeStep.large,
          font: ReadingFont.hyperlegible,
          calmMode: true,
        ),
      );
    });

    test('reset restores and saves the defaults', () async {
      final store = InMemoryKeyValueStore({
        PreferenceKeys.textSize: 'small',
        PreferenceKeys.calmMode: true,
      });
      final container = _container(store);

      await container.read(comfortControllerProvider.notifier).reset();

      expect(container.read(comfortControllerProvider).isDefault, isTrue);
      expect(
        _container(store).read(comfortControllerProvider).isDefault,
        isTrue,
      );
    });
  });
}
