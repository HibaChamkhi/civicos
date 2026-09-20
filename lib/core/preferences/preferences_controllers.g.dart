// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_controllers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Theme choice, persisted across launches.

@ProviderFor(ThemePreferenceController)
final themePreferenceControllerProvider = ThemePreferenceControllerProvider._();

/// Theme choice, persisted across launches.
final class ThemePreferenceControllerProvider
    extends $NotifierProvider<ThemePreferenceController, ThemePreference> {
  /// Theme choice, persisted across launches.
  ThemePreferenceControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themePreferenceControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themePreferenceControllerHash();

  @$internal
  @override
  ThemePreferenceController create() => ThemePreferenceController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemePreference value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemePreference>(value),
    );
  }
}

String _$themePreferenceControllerHash() =>
    r'16605893c616410b54cc6bd44a5a14291dbfe11c';

/// Theme choice, persisted across launches.

abstract class _$ThemePreferenceController extends $Notifier<ThemePreference> {
  ThemePreference build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ThemePreference, ThemePreference>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemePreference, ThemePreference>,
              ThemePreference,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Whether light haptic confirmations are on. Defaults to on.

@ProviderFor(HapticsController)
final hapticsControllerProvider = HapticsControllerProvider._();

/// Whether light haptic confirmations are on. Defaults to on.
final class HapticsControllerProvider
    extends $NotifierProvider<HapticsController, bool> {
  /// Whether light haptic confirmations are on. Defaults to on.
  HapticsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hapticsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hapticsControllerHash();

  @$internal
  @override
  HapticsController create() => HapticsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hapticsControllerHash() => r'51dd7e8bcf078c56666f3de207f3e4e785481fbe';

/// Whether light haptic confirmations are on. Defaults to on.

abstract class _$HapticsController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Text size, reading font and calm mode, persisted across launches.

@ProviderFor(ComfortController)
final comfortControllerProvider = ComfortControllerProvider._();

/// Text size, reading font and calm mode, persisted across launches.
final class ComfortControllerProvider
    extends $NotifierProvider<ComfortController, ComfortSettings> {
  /// Text size, reading font and calm mode, persisted across launches.
  ComfortControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'comfortControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$comfortControllerHash();

  @$internal
  @override
  ComfortController create() => ComfortController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ComfortSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ComfortSettings>(value),
    );
  }
}

String _$comfortControllerHash() => r'4bb0911b7c868e23efc3379ab7faa89b93dce8e9';

/// Text size, reading font and calm mode, persisted across launches.

abstract class _$ComfortController extends $Notifier<ComfortSettings> {
  ComfortSettings build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ComfortSettings, ComfortSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ComfortSettings, ComfortSettings>,
              ComfortSettings,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Language choice, persisted across launches.

@ProviderFor(LanguageController)
final languageControllerProvider = LanguageControllerProvider._();

/// Language choice, persisted across launches.
final class LanguageControllerProvider
    extends $NotifierProvider<LanguageController, AppLanguage> {
  /// Language choice, persisted across launches.
  LanguageControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageControllerHash();

  @$internal
  @override
  LanguageController create() => LanguageController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLanguage>(value),
    );
  }
}

String _$languageControllerHash() =>
    r'423668e90101f1bf661aeee0c4d020e503c9202c';

/// Language choice, persisted across launches.

abstract class _$LanguageController extends $Notifier<AppLanguage> {
  AppLanguage build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppLanguage, AppLanguage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLanguage, AppLanguage>,
              AppLanguage,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
