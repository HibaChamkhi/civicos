import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Shown instead of the app when the build is misconfigured, so a developer
/// sees what to fix instead of a frozen splash screen. Never reachable in a
/// correctly built release.
class ConfigurationErrorApp extends StatelessWidget {
  const ConfigurationErrorApp({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(Space.gutter),
              children: [
                Text("CivicOS can't start", style: context.type.title1),
                const SizedBox(height: Space.sm),
                SelectableText(message, style: context.type.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
