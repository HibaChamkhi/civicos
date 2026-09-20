import 'dart:async';

import 'package:civicos/core/preferences/app_language.dart';
import 'package:civicos/core/preferences/preferences_controllers.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String appLanguageLabel(AppLocalizations l10n, AppLanguage language) {
  return switch (language) {
    AppLanguage.system => l10n.languageSystem,
    AppLanguage.english => l10n.languageEnglish,
    AppLanguage.arabic => l10n.languageArabic,
  };
}

/// Language choice. Each option is written in its own language, so someone
/// who cannot read the current one can still find theirs.
class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final selected = ref.watch(languageControllerProvider);

    return CivicScaffold(
      title: l10n.languageTitle,
      subtitle: l10n.languageIntro,
      children: [
        const SizedBox(height: 16),
        CivicCard(
          padding: EdgeInsets.zero,
          child: RadioGroup<AppLanguage>(
            groupValue: selected,
            onChanged: (language) {
              if (language == null) return;
              unawaited(
                ref.read(languageControllerProvider.notifier).select(language),
              );
            },
            child: Column(
              children: [
                for (final language in AppLanguage.values) ...[
                  if (language != AppLanguage.values.first) const Divider(),
                  RadioListTile<AppLanguage>(
                    value: language,
                    title: Text(appLanguageLabel(l10n, language)),
                    subtitle: language == AppLanguage.system
                        ? Text(l10n.languageSystemSubtitle)
                        : null,
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
