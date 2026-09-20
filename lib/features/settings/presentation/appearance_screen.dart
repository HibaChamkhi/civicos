import 'dart:async';

import 'package:civicos/core/preferences/preferences_controllers.dart';
import 'package:civicos/core/preferences/theme_preference.dart';
import 'package:civicos/features/settings/presentation/theme_preference_labels.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AppearanceScreen extends ConsumerWidget {
  const AppearanceScreen({super.key});

  static IconData _iconFor(ThemePreference preference) {
    return switch (preference) {
      ThemePreference.system => LucideIcons.smartphone,
      ThemePreference.light => LucideIcons.sun,
      ThemePreference.dark => LucideIcons.moon,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final selected = ref.watch(themePreferenceControllerProvider);

    return CivicScaffold(
      title: l10n.appearanceTitle,
      subtitle: l10n.appearanceIntro,
      children: [
        const SizedBox(height: 16),
        CivicCard(
          padding: EdgeInsets.zero,
          child: RadioGroup<ThemePreference>(
            groupValue: selected,
            onChanged: (value) {
              if (value == null) return;
              unawaited(
                ref
                    .read(themePreferenceControllerProvider.notifier)
                    .select(value),
              );
            },
            child: Column(
              children: [
                for (final preference in ThemePreference.values) ...[
                  if (preference != ThemePreference.values.first)
                    const Divider(),
                  RadioListTile<ThemePreference>(
                    value: preference,
                    secondary: Icon(_iconFor(preference)),
                    title: Text(themePreferenceLabel(l10n, preference)),
                    subtitle: Text(
                      themePreferenceDescription(l10n, preference),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
