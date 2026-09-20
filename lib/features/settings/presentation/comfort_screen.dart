import 'dart:async';

import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/preferences/comfort_settings.dart';
import 'package:civicos/core/preferences/preferences_controllers.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_button.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/list_row.dart';
import 'package:civicos/shared/widgets/ui/section_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

String textSizeName(AppLocalizations l10n, TextSizeStep step) {
  return switch (step) {
    TextSizeStep.small => l10n.textSizeSmall,
    TextSizeStep.standard => l10n.textSizeStandard,
    TextSizeStep.large => l10n.textSizeLarge,
    TextSizeStep.larger => l10n.textSizeLarger,
    TextSizeStep.largest => l10n.textSizeLargest,
  };
}

/// Text size, reading font and calm mode, with a live preview. Every change
/// applies to the whole app immediately.
class ComfortScreen extends ConsumerWidget {
  const ComfortScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final comfort = ref.watch(comfortControllerProvider);
    final controller = ref.read(comfortControllerProvider.notifier);
    final sizeName = textSizeName(l10n, comfort.textSize);
    const steps = TextSizeStep.values;

    return CivicScaffold(
      title: l10n.comfortTitle,
      subtitle: l10n.comfortIntro,
      children: [
        // The text-size control comes first so it stays under the person's
        // finger; the preview below grows as the text does.
        SectionLabel(l10n.comfortTextSize),
        CivicCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.textSizeValue(
                  sizeName,
                  (comfort.textSize.factor * 100).round(),
                ),
                style: context.type.headline,
              ),
              Row(
                children: [
                  ExcludeSemantics(
                    child: Text('A', style: context.type.callout),
                  ),
                  Expanded(
                    child: Semantics(
                      label: l10n.comfortTextSize,
                      child: Slider(
                        value: comfort.textSize.index.toDouble(),
                        max: (steps.length - 1).toDouble(),
                        divisions: steps.length - 1,
                        label: sizeName,
                        semanticFormatterCallback: (value) =>
                            textSizeName(l10n, steps[value.round()]),
                        onChanged: (value) => unawaited(
                          controller.setTextSize(steps[value.round()]),
                        ),
                      ),
                    ),
                  ),
                  ExcludeSemantics(
                    child: Text('A', style: context.type.title2),
                  ),
                ],
              ),
              Text(l10n.comfortTextSizeHint, style: context.type.footnote),
            ],
          ),
        ),
        const SizedBox(height: Space.md),
        const _Preview(),
        SectionLabel(l10n.comfortFont),
        CivicCard(
          padding: EdgeInsets.zero,
          child: RadioGroup<ReadingFont>(
            groupValue: comfort.font,
            onChanged: (font) {
              if (font != null) unawaited(controller.setFont(font));
            },
            child: Column(
              children: [
                RadioListTile<ReadingFont>(
                  value: ReadingFont.standard,
                  title: Text(
                    l10n.fontStandard,
                    style: const TextStyle(fontFamily: CivicFonts.body),
                  ),
                  subtitle: Text(
                    l10n.fontStandardSubtitle,
                    style: const TextStyle(fontFamily: CivicFonts.body),
                  ),
                ),
                const Divider(),
                RadioListTile<ReadingFont>(
                  value: ReadingFont.hyperlegible,
                  title: Text(
                    l10n.fontHyperlegible,
                    style: const TextStyle(fontFamily: CivicFonts.hyperlegible),
                  ),
                  subtitle: Text(
                    l10n.fontHyperlegibleSubtitle,
                    style: const TextStyle(fontFamily: CivicFonts.hyperlegible),
                  ),
                ),
              ],
            ),
          ),
        ),
        SectionLabel(l10n.comfortMotionSection),
        CivicCard(
          padding: EdgeInsets.zero,
          child: ListRow(
            title: l10n.comfortCalm,
            subtitle: l10n.comfortCalmSubtitle,
            onTap: () => unawaited(
              controller.setCalmMode(enabled: !comfort.calmMode),
            ),
            trailing: Switch(
              value: comfort.calmMode,
              onChanged: (enabled) =>
                  unawaited(controller.setCalmMode(enabled: enabled)),
            ),
          ),
        ),
        if (!comfort.isDefault) ...[
          const SizedBox(height: Space.lg),
          CivicButton(
            label: l10n.comfortReset,
            icon: LucideIcons.refreshCw,
            variant: CivicButtonVariant.secondary,
            onPressed: () => unawaited(controller.reset()),
          ),
        ],
      ],
    );
  }
}

/// Sample content that updates live as settings change.
class _Preview extends StatelessWidget {
  const _Preview();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CivicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.comfortPreviewLabel.toUpperCase(),
            style: context.type.label,
          ),
          const SizedBox(height: Space.xs),
          Text(l10n.comfortPreviewTitle, style: context.type.title2),
          const SizedBox(height: Space.xxs),
          Text(l10n.comfortPreviewBody, style: context.type.body),
          const SizedBox(height: Space.xs),
          Text(l10n.comfortPreviewMeta, style: context.type.footnote),
        ],
      ),
    );
  }
}
