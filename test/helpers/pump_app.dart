import 'package:civicos/app/app.dart';
import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/core/env/app_env_provider.dart';
import 'package:civicos/core/env/env.dart';
import 'package:civicos/core/network/connectivity.dart';
import 'package:civicos/core/sample/sample_data.dart';
import 'package:civicos/core/storage/key_value_store_provider.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'in_memory_key_value_store.dart';

/// A portrait phone viewport (iPhone 15 size).
void usePhoneViewport(WidgetTester tester) {
  tester.view
    ..physicalSize = const Size(393 * 3, 852 * 3)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

/// Pumps the whole app with in-memory preferences and a fake network.
Future<void> pumpCivicApp(
  WidgetTester tester, {
  InMemoryKeyValueStore? store,
  bool online = true,
  AppEnv env = AppEnv.development,
}) async {
  usePhoneViewport(tester);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        keyValueStoreProvider.overrideWithValue(
          store ?? InMemoryKeyValueStore(),
        ),
        appEnvProvider.overrideWithValue(env),
        isOnlineProvider.overrideWith((ref) => Stream.value(online)),
      ],
      child: const CivicApp(),
    ),
  );
  // Let the sample repositories' simulated latency elapse. Without this the
  // timers can still be pending when animations are switched off.
  await tester.pump(SampleData.latency + const Duration(milliseconds: 50));
  await tester.pumpAndSettle();
}

/// Pumps a single widget inside a themed, localized app.
Future<void> pumpThemed(
  WidgetTester tester,
  Widget child, {
  ThemeData? theme,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: theme ?? AppTheme.light(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: Padding(padding: const EdgeInsets.all(16), child: child),
      ),
    ),
  );
}
