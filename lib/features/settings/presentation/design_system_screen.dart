import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/app/theme/tone.dart';
import 'package:civicos/core/env/app_env_provider.dart';
import 'package:civicos/core/errors/app_failure.dart';
import 'package:civicos/core/utils/formatters.dart';
import 'package:civicos/core/validation/validators.dart';
import 'package:civicos/features/settings/presentation/not_found_screen.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/system/error_state.dart';
import 'package:civicos/shared/widgets/system/failure_message.dart';
import 'package:civicos/shared/widgets/ui/avatar.dart';
import 'package:civicos/shared/widgets/ui/civic_button.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/civic_chip.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/civic_text_field.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:civicos/shared/widgets/ui/list_row.dart';
import 'package:civicos/shared/widgets/ui/progress_bar.dart';
import 'package:civicos/shared/widgets/ui/section_label.dart';
import 'package:civicos/shared/widgets/ui/skeleton.dart';
import 'package:civicos/shared/widgets/ui/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Developer-only gallery of every design-system component, in both themes.
/// The sample content is illustrative, not real data.
class DesignSystemScreen extends ConsumerStatefulWidget {
  const DesignSystemScreen({super.key});

  @override
  ConsumerState<DesignSystemScreen> createState() => _DesignSystemState();
}

class _DesignSystemState extends ConsumerState<DesignSystemScreen> {
  final _selectedChips = <String>{'Environment'};
  bool _loading = false;

  static const _statuses = <(String, IconData, Tone)>[
    ('Reported', LucideIcons.circleDot, Tone.neutral),
    ('Under review', LucideIcons.search, Tone.warning),
    ('Accepted', LucideIcons.check, Tone.info),
    ('Assigned', LucideIcons.userCheck, Tone.info),
    ('In progress', LucideIcons.hammer, Tone.accent),
    ('Resolved', LucideIcons.circleCheck, Tone.success),
  ];

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(appEnvProvider).isDevelopment) {
      return const NotFoundScreen();
    }
    final l10n = context.l10n;
    final c = context.civic;

    return CivicScaffold(
      title: 'Design system',
      subtitle: 'Every component, with example content.',
      children: [
        const SectionLabel('Buttons'),
        Wrap(
          spacing: Space.xs,
          runSpacing: Space.xs,
          children: [
            CivicButton(label: 'Find an opportunity', onPressed: () {}),
            CivicButton(
              label: 'Report an issue',
              icon: LucideIcons.mapPin,
              variant: CivicButtonVariant.secondary,
              onPressed: () {},
            ),
            CivicButton(
              label: 'See my impact',
              variant: CivicButtonVariant.ghost,
              onPressed: () {},
            ),
            CivicButton(
              label: 'Leave mission',
              variant: CivicButtonVariant.danger,
              onPressed: () {},
            ),
            CivicButton(
              label: 'Save',
              isLoading: _loading,
              onPressed: () => setState(() => _loading = !_loading),
            ),
            const CivicButton(label: 'Disabled', onPressed: null),
          ],
        ),
        const SectionLabel('Text fields'),
        CivicTextField(
          label: 'Email',
          hint: 'name@example.com',
          errorText: validationMessage(
            l10n,
            Validators.email('amine@exmple'),
          ),
        ),
        const SizedBox(height: Space.md),
        const CivicTextField(label: 'Password', obscureText: true),
        const SectionLabel('Issue lifecycle'),
        Wrap(
          spacing: Space.xs,
          runSpacing: Space.xs,
          children: [
            for (final (index, (label, icon, tone)) in _statuses.indexed)
              StatusBadge(
                label: label,
                icon: icon,
                tone: tone,
                step: index + 1,
                totalSteps: _statuses.length,
              ),
            const StatusBadge(
              label: 'Declined',
              icon: LucideIcons.circleX,
              tone: Tone.danger,
            ),
          ],
        ),
        const SectionLabel('Filter chips'),
        Wrap(
          spacing: Space.xs,
          runSpacing: Space.xs,
          children: [
            for (final label in ['Environment', 'Education', 'Health'])
              CivicChip(
                label: label,
                selected: _selectedChips.contains(label),
                onSelected: (selected) => setState(() {
                  selected
                      ? _selectedChips.add(label)
                      : _selectedChips.remove(label);
                }),
              ),
          ],
        ),
        const SectionLabel('Impact'),
        CivicCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('THIS WEEK', style: context.type.label),
              const SizedBox(height: Space.xs),
              Text(
                '${Formatters.decimal(4.5)} hours',
                style: context.type.display,
              ),
              const SizedBox(height: Space.sm),
              Text(
                'Level 3 · Community Helper · '
                '${Formatters.decimal(1240)} / ${Formatters.decimal(1800)} XP',
                style: context.type.footnote,
              ),
              const SizedBox(height: Space.xs),
              const ProgressBar(
                value: 1240 / 1800,
                semanticLabel: 'Progress to Community Builder',
              ),
            ],
          ),
        ),
        const SectionLabel('Avatars and rows'),
        CivicCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              ListRow(
                title: 'Amine Ben Salah',
                subtitle: '12 hours this month',
                trailing: const Avatar(name: 'Amine Ben Salah'),
                onTap: () {},
              ),
              const Divider(),
              ListRow(
                leadingIcon: LucideIcons.flag,
                title: 'Clean Streets mission',
                subtitle: '2 of 3 tasks done',
                onTap: () {},
              ),
            ],
          ),
        ),
        const SectionLabel('Loading'),
        const Skeleton(width: 200, height: 22),
        const SizedBox(height: Space.sm),
        const Skeleton(),
        const SectionLabel('Empty and error states'),
        EmptyState(
          icon: LucideIcons.mapPin,
          title: 'No open issues nearby',
          body: 'Your neighborhood is looking good.',
          actionLabel: 'Report an issue',
          onAction: () {},
        ),
        ErrorState(failure: const NetworkFailure(), onRetry: () {}),
        const SectionLabel('Palette'),
        Wrap(
          spacing: Space.xs,
          runSpacing: Space.xs,
          children: [
            for (final (name, color) in [
              ('primary', c.primary),
              ('accent', c.accent),
              ('surface', c.surface),
              ('sunken', c.surfaceSunken),
              ('success', c.success),
              ('warning', c.warning),
              ('danger', c.danger),
              ('info', c.info),
            ])
              Semantics(
                label: name,
                child: Container(
                  width: 64,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(Radii.sm),
                    border: Border.all(color: c.border),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
