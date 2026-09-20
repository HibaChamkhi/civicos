import 'package:civicos/app/router/routes.dart';
import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/utils/formatters.dart';
import 'package:civicos/features/impact/data/impact_repository.dart';
import 'package:civicos/features/impact/domain/impact_summary.dart';
import 'package:civicos/features/profile/domain/profile_summary.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/charts/weekly_bars.dart';
import 'package:civicos/shared/widgets/system/async_value_view.dart';
import 'package:civicos/shared/widgets/system/sample_data_notice.dart';
import 'package:civicos/shared/widgets/ui/avatar.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/civic_icon_button.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/progress_bar.dart';
import 'package:civicos/shared/widgets/ui/section_header.dart';
import 'package:civicos/shared/widgets/ui/stat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Profile, level and everything you've contributed so far.
class YouScreen extends ConsumerWidget {
  const YouScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return CivicScaffold(
      title: l10n.youTitle,
      actions: [
        CivicIconButton(
          icon: LucideIcons.settings,
          semanticLabel: l10n.settingsTooltip,
          onPressed: () => const SettingsRoute().push<void>(context),
        ),
      ],
      children: [
        const SampleDataNotice(),
        const SizedBox(height: Space.md),
        AsyncValueView<ProfileSummary>(
          value: ref.watch(profileSummaryProvider),
          onRetry: () => ref.invalidate(profileSummaryProvider),
          empty: const SizedBox.shrink(),
          data: _ProfileHeader.new,
        ),
        AsyncValueView<ImpactSummary>(
          value: ref.watch(impactSummaryProvider),
          onRetry: () => ref.invalidate(impactSummaryProvider),
          empty: const SizedBox.shrink(),
          data: _ImpactSections.new,
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader(this.profile);

  final ProfileSummary profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CivicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Avatar(name: profile.displayName, size: 56),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile.displayName, style: context.type.title2),
                    const SizedBox(height: 2),
                    Text(
                      '${profile.neighborhood} · ${profile.city}',
                      style: context.type.footnote,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Space.sm),
          Text(l10n.youTrust(profile.trustScore), style: context.type.footnote),
          const SizedBox(height: Space.md),
          Text(l10n.youSkills.toUpperCase(), style: context.type.label),
          const SizedBox(height: Space.xs),
          _Tags(values: profile.skills),
          const SizedBox(height: Space.sm),
          Text(l10n.youInterests.toUpperCase(), style: context.type.label),
          const SizedBox(height: Space.xs),
          _Tags(values: profile.interests),
        ],
      ),
    );
  }
}

class _ImpactSections extends StatelessWidget {
  const _ImpactSections(this.impact);

  final ImpactSummary impact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final stats = <(String, String)>[
      (Formatters.decimal(impact.totalHours), l10n.statHours),
      ('${impact.issuesReported}', l10n.statIssuesReported),
      ('${impact.issuesResolved}', l10n.statIssuesResolved),
      ('${impact.peopleHelped}', l10n.statPeopleHelped),
      ('${impact.missionsCompleted}', l10n.statMissions),
      ('${impact.eventsAttended}', l10n.statEvents),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Space.sm),
        CivicCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.levelLine(impact.levelNumber, impact.levelName),
                style: context.type.headline,
              ),
              const SizedBox(height: Space.xs),
              ProgressBar(
                value: impact.levelProgress,
                semanticLabel: l10n.levelProgressSemantics(
                  impact.levelNumber + 1,
                ),
              ),
              const SizedBox(height: Space.xs),
              Text(
                l10n.xpLine(
                  Formatters.decimal(impact.xp),
                  Formatters.decimal(impact.xpForNextLevel),
                ),
                style: context.type.footnote,
              ),
            ],
          ),
        ),
        SectionHeader(l10n.sectionThisWeek),
        CivicCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: Space.xs,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    Formatters.decimal(impact.hoursThisWeek),
                    style: context.type.title1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(l10n.hoursUnit, style: context.type.callout),
                  ),
                ],
              ),
              const SizedBox(height: Space.sm),
              WeeklyBars(week: impact.week),
            ],
          ),
        ),
        SectionHeader(l10n.youStats),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth > 420 ? 3 : 2;
            final width =
                (constraints.maxWidth - Space.sm * (columns - 1)) / columns;
            return Wrap(
              spacing: Space.sm,
              runSpacing: Space.sm,
              children: [
                for (final (value, label) in stats)
                  SizedBox(
                    width: width,
                    child: StatTile(value: value, label: label),
                  ),
              ],
            );
          },
        ),
        SectionHeader(l10n.youBadges),
        Wrap(
          spacing: Space.xs,
          runSpacing: Space.xs,
          children: [
            for (final badge in impact.badges) _BadgeChip(badge: badge),
          ],
        ),
      ],
    );
  }
}

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({required this.badge});

  final ImpactBadge badge;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    final l10n = context.l10n;
    final earned = badge.isEarned;

    return Semantics(
      container: true,
      label: earned ? badge.name : '${badge.name}, ${l10n.badgeLocked}',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Space.sm,
          vertical: Space.xs,
        ),
        decoration: BoxDecoration(
          color: earned ? c.accentWash : c.surfaceSunken,
          borderRadius: BorderRadius.circular(Radii.pill),
          border: Border.all(color: earned ? c.accent : c.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              earned ? LucideIcons.medal : LucideIcons.circleDot,
              size: 16,
              color: earned ? c.accentText : c.textMuted,
            ),
            const SizedBox(width: Space.xs),
            Text(
              badge.name,
              style: context.type.footnote.copyWith(
                color: earned ? c.accentText : c.textMuted,
                fontWeight: earned ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({required this.values});

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    final c = context.civic;
    return Wrap(
      spacing: Space.xs,
      runSpacing: Space.xs,
      children: [
        for (final value in values)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Space.sm,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: c.surfaceSunken,
              borderRadius: BorderRadius.circular(Radii.pill),
              border: Border.all(color: c.border),
            ),
            child: Text(value, style: context.type.footnote),
          ),
      ],
    );
  }
}
