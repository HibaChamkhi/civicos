import 'package:civicos/app/router/routes.dart';
import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/utils/formatters.dart';
import 'package:civicos/features/community/data/feed_repository.dart';
import 'package:civicos/features/community/domain/feed_item.dart';
import 'package:civicos/features/community/presentation/widgets/feed_tile.dart';
import 'package:civicos/features/home/domain/day_part.dart';
import 'package:civicos/features/impact/data/impact_repository.dart';
import 'package:civicos/features/impact/domain/impact_summary.dart';
import 'package:civicos/features/issues/data/issues_repository.dart';
import 'package:civicos/features/issues/domain/issue.dart';
import 'package:civicos/features/issues/presentation/widgets/issue_card.dart';
import 'package:civicos/features/volunteering/data/opportunities_repository.dart';
import 'package:civicos/features/volunteering/domain/opportunity.dart';
import 'package:civicos/features/volunteering/presentation/widgets/opportunity_card.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/system/async_value_view.dart';
import 'package:civicos/shared/widgets/system/sample_data_notice.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/civic_icon_button.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:civicos/shared/widgets/ui/progress_bar.dart';
import 'package:civicos/shared/widgets/ui/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// The dashboard: what needs attention near you, what fits your skills,
/// and what the community got done.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final greeting = switch (DayPart.of(DateTime.now())) {
      DayPart.morning => l10n.greetingMorning,
      DayPart.afternoon => l10n.greetingAfternoon,
      DayPart.evening => l10n.greetingEvening,
    };
    final name = ref.watch(profileSummaryProvider).value?.firstName;
    final openCount = ref.watch(openIssuesProvider).value?.length;

    return CivicScaffold(
      title: name == null ? greeting : l10n.greetingWithName(greeting, name),
      subtitle: openCount == null
          ? l10n.homeSubtitle
          : l10n.homeOpenIssues(openCount),
      actions: [
        CivicIconButton(
          icon: LucideIcons.bell,
          semanticLabel: l10n.notificationsTooltip,
          onPressed: () => const NotificationsRoute().push<void>(context),
        ),
        CivicIconButton(
          icon: LucideIcons.settings,
          semanticLabel: l10n.settingsTooltip,
          onPressed: () => const SettingsRoute().push<void>(context),
        ),
      ],
      children: [
        const SampleDataNotice(),
        const SizedBox(height: Space.md),
        const _WeekCard(),
        SectionHeader(
          l10n.sectionNearYou,
          actionLabel: l10n.seeAll,
          onAction: () => const MapRoute().go(context),
        ),
        AsyncValueView<List<Issue>>(
          value: ref.watch(openIssuesProvider),
          isEmpty: (issues) => issues.isEmpty,
          onRetry: () => ref.invalidate(nearbyIssuesProvider),
          empty: EmptyState(
            icon: LucideIcons.mapPin,
            title: l10n.homeEmptyTitle,
            body: l10n.homeEmptyBody,
            actionLabel: l10n.homeEmptyAction,
            onAction: () => const MapRoute().go(context),
          ),
          data: (issues) => Column(
            children: [
              for (final issue in issues.take(2))
                Padding(
                  padding: const EdgeInsets.only(bottom: Space.sm),
                  child: IssueCard(issue: issue),
                ),
            ],
          ),
        ),
        SectionHeader(
          l10n.sectionMatched,
          actionLabel: l10n.seeAll,
          onAction: () => const ActRoute().go(context),
        ),
        AsyncValueView<List<Opportunity>>(
          value: ref.watch(matchedOpportunitiesProvider),
          isEmpty: (items) => items.isEmpty,
          onRetry: () => ref.invalidate(matchedOpportunitiesProvider),
          empty: EmptyState(
            icon: LucideIcons.handHeart,
            title: l10n.actEmptyTitle,
            body: l10n.actEmptyBody,
            actionLabel: l10n.actEmptyAction,
            onAction: () => const LearnRoute().go(context),
          ),
          data: (items) => Column(
            children: [
              for (final opportunity in items.take(2))
                Padding(
                  padding: const EdgeInsets.only(bottom: Space.sm),
                  child: OpportunityCard(opportunity: opportunity),
                ),
            ],
          ),
        ),
        SectionHeader(l10n.sectionCommunity),
        AsyncValueView<List<FeedItem>>(
          value: ref.watch(communityFeedProvider),
          isEmpty: (items) => items.isEmpty,
          onRetry: () => ref.invalidate(communityFeedProvider),
          empty: EmptyState(
            icon: LucideIcons.users,
            title: l10n.notificationsEmptyTitle,
            body: l10n.notificationsEmptyBody,
          ),
          data: (items) => CivicCard(
            padding: const EdgeInsets.symmetric(horizontal: Space.md),
            child: Column(
              children: [
                for (final item in items.take(3)) FeedTile(item: item),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Hours and level progress for the current week.
class _WeekCard extends ConsumerWidget {
  const _WeekCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AsyncValueView<ImpactSummary>(
      value: ref.watch(impactSummaryProvider),
      onRetry: () => ref.invalidate(impactSummaryProvider),
      empty: const SizedBox.shrink(),
      data: (impact) => CivicCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.sectionThisWeek.toUpperCase(),
              style: context.type.label,
            ),
            const SizedBox(height: Space.xs),
            // Wrap, not Row: at large text sizes the number and the unit
            // need to fall onto separate lines instead of overflowing.
            Wrap(
              spacing: Space.xs,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  Formatters.decimal(impact.hoursThisWeek),
                  style: context.type.display,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(l10n.hoursUnit, style: context.type.headline),
                ),
              ],
            ),
            const SizedBox(height: Space.sm),
            Text(
              l10n.levelLine(impact.levelNumber, impact.levelName),
              style: context.type.callout,
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
              l10n.xpToNextLevel(Formatters.decimal(impact.xpToNextLevel)),
              style: context.type.footnote,
            ),
          ],
        ),
      ),
    );
  }
}
