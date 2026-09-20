import 'dart:async';

import 'package:civicos/app/app.dart';
import 'package:civicos/app/configuration_error_app.dart';
import 'package:civicos/core/env/app_env_provider.dart';
import 'package:civicos/core/env/env.dart';
import 'package:civicos/core/storage/key_value_store.dart';
import 'package:civicos/core/storage/key_value_store_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  // Keep the native splash up until preferences are loaded, so the first
  // frame is already in the person's chosen theme.
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  final AppEnv appEnv;
  try {
    appEnv = Env.parseAppEnv(Env.rawAppEnv);
  } on EnvException catch (error) {
    FlutterNativeSplash.remove();
    runApp(ConfigurationErrorApp(message: error.message));
    return;
  }

  unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
  final store = await SharedPreferencesKeyValueStore.create();

  runApp(
    ProviderScope(
      overrides: [
        appEnvProvider.overrideWithValue(appEnv),
        keyValueStoreProvider.overrideWithValue(store),
      ],
      child: const CivicApp(),
    ),
  );
}
