import 'dart:async';

import 'package:civicos/app/router/routes.dart';
import 'package:civicos/core/env/app_env_provider.dart';
import 'package:civicos/core/preferences/haptics.dart';
import 'package:civicos/core/preferences/preferences_controllers.dart';
import 'package:civicos/features/settings/presentation/comfort_screen.dart';
import 'package:civicos/features/settings/presentation/language_screen.dart';
import 'package:civicos/features/settings/presentation/theme_preference_labels.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/list_row.dart';
import 'package:civicos/shared/widgets/ui/section_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = ref.watch(themePreferenceControllerProvider);
    final hapticsOn = ref.watch(hapticsControllerProvider);
    final comfort = ref.watch(comfortControllerProvider);
    final isDevelopment = ref.watch(appEnvProvider).isDevelopment;
    final language = ref.watch(languageControllerProvider);

    void setHaptics({required bool enabled}) {
      unawaited(
        ref
            .read(hapticsControllerProvider.notifier)
            .setEnabled(enabled: enabled),
      );
      if (enabled) unawaited(selectionHaptic(ref));
    }

    return CivicScaffold(
      title: l10n.settingsTitle,
      children: [
        SectionLabel(l10n.settingsSectionPreferences),
        CivicCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              ListRow(
                leadingIcon: LucideIcons.palette,
                title: l10n.settingsAppearance,
                subtitle: themePreferenceLabel(l10n, theme),
                onTap: () => const AppearanceRoute().push<void>(context),
              ),
              const Divider(),
              ListRow(
                leadingIcon: LucideIcons.languages,
                title: l10n.settingsLanguage,
                subtitle: appLanguageLabel(l10n, language),
                onTap: () => const LanguageRoute().push<void>(context),
              ),
              const Divider(),
              ListRow(
                leadingIcon: LucideIcons.eye,
                title: l10n.settingsComfort,
                subtitle: comfort.isDefault
                    ? l10n.settingsComfortSubtitle
                    : textSizeName(l10n, comfort.textSize),
                onTap: () => const ComfortRoute().push<void>(context),
              ),
              const Divider(),
              ListRow(
                leadingIcon: LucideIcons.vibrate,
                title: l10n.settingsHaptics,
                subtitle: comfort.calmMode
                    ? l10n.settingsHapticsOffInCalm
                    : l10n.settingsHapticsSubtitle,
                onTap: comfort.calmMode
                    ? null
                    : () => setHaptics(enabled: !hapticsOn),
                trailing: Switch(
                  value: hapticsOn && !comfort.calmMode,
                  onChanged: comfort.calmMode
                      ? null
                      : (enabled) => setHaptics(enabled: enabled),
                ),
              ),
            ],
          ),
        ),
        if (isDevelopment) ...[
          SectionLabel(l10n.settingsSectionDeveloper),
          CivicCard(
            padding: EdgeInsets.zero,
            child: ListRow(
              leadingIcon: LucideIcons.layoutGrid,
              title: l10n.settingsDesignSystem,
              subtitle: l10n.settingsDesignSystemSubtitle,
              onTap: () => const DesignSystemRoute().push<void>(context),
            ),
          ),
        ],
      ],
    );
  }
}
