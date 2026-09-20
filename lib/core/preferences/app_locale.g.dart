// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_locale.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The locale the app actually runs in: the chosen language, or the first
/// phone language CivicOS supports, or English.

@ProviderFor(appLocale)
final appLocaleProvider = AppLocaleProvider._();

/// The locale the app actually runs in: the chosen language, or the first
/// phone language CivicOS supports, or English.

final class AppLocaleProvider
    extends $FunctionalProvider<Locale, Locale, Locale>
    with $Provider<Locale> {
  /// The locale the app actually runs in: the chosen language, or the first
  /// phone language CivicOS supports, or English.
  AppLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLocaleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLocaleHash();

  @$internal
  @override
  $ProviderElement<Locale> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Locale create(Ref ref) {
    return appLocale(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$appLocaleHash() => r'fbafacfb63e266b7d10b49a49db5ee11bdc22c4e';

/// Whether text runs right to left, which also decides the Arabic typeface.

@ProviderFor(isArabic)
final isArabicProvider = IsArabicProvider._();

/// Whether text runs right to left, which also decides the Arabic typeface.

final class IsArabicProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether text runs right to left, which also decides the Arabic typeface.
  IsArabicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isArabicProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isArabicHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isArabic(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isArabicHash() => r'f3a6badf47621b499d46fb08f249b02883f25e8e';
