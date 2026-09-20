import 'package:civicos/app/router/routes.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/features/events/data/events_repository.dart';
import 'package:civicos/features/events/domain/community_event.dart';
import 'package:civicos/features/events/presentation/widgets/event_card.dart';
import 'package:civicos/features/missions/data/missions_repository.dart';
import 'package:civicos/features/missions/domain/mission.dart';
import 'package:civicos/features/missions/presentation/widgets/mission_card.dart';
import 'package:civicos/features/volunteering/data/opportunities_repository.dart';
import 'package:civicos/features/volunteering/domain/opportunity.dart';
import 'package:civicos/features/volunteering/presentation/widgets/opportunity_card.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/system/async_value_view.dart';
import 'package:civicos/shared/widgets/ui/civic_chip.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum _ActSegment { forYou, volunteer, missions, events }

/// Ways to give time and skills: matches first, then everything on offer.
class ActScreen extends ConsumerStatefulWidget {
  const ActScreen({super.key});

  @override
  ConsumerState<ActScreen> createState() => _ActScreenState();
}

class _ActScreenState extends ConsumerState<ActScreen> {
  _ActSegment _segment = _ActSegment.forYou;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    String labelFor(_ActSegment segment) => switch (segment) {
      _ActSegment.forYou => l10n.actForYou,
      _ActSegment.volunteer => l10n.actVolunteer,
      _ActSegment.missions => l10n.actMissions,
      _ActSegment.events => l10n.actEvents,
    };

    return CivicScaffold(
      title: l10n.actTitle,
      children: [
        const SizedBox(height: Space.sm),
        Wrap(
          spacing: Space.xs,
          runSpacing: Space.xs,
          children: [
            for (final segment in _ActSegment.values)
              CivicChip(
                label: labelFor(segment),
                selected: _segment == segment,
                onSelected: (_) => setState(() => _segment = segment),
              ),
          ],
        ),
        const SizedBox(height: Space.md),
        switch (_segment) {
          _ActSegment.forYou => const _MatchedList(),
          _ActSegment.volunteer => const _AllOpportunitiesList(),
          _ActSegment.missions => const _MissionsList(),
          _ActSegment.events => const _EventsList(),
        },
      ],
    );
  }
}

class _MatchedList extends ConsumerWidget {
  const _MatchedList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AsyncValueView<List<Opportunity>>(
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
          for (final opportunity in items)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.sm),
              child: OpportunityCard(opportunity: opportunity),
            ),
        ],
      ),
    );
  }
}

class _AllOpportunitiesList extends ConsumerWidget {
  const _AllOpportunitiesList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AsyncValueView<List<Opportunity>>(
      value: ref.watch(allOpportunitiesProvider),
      isEmpty: (items) => items.isEmpty,
      onRetry: () => ref.invalidate(allOpportunitiesProvider),
      empty: EmptyState(
        icon: LucideIcons.handHeart,
        title: l10n.actEmptyTitle,
        body: l10n.actEmptyBody,
      ),
      data: (items) => Column(
        children: [
          for (final opportunity in items)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.sm),
              child: OpportunityCard(
                opportunity: opportunity,
                showMatch: false,
              ),
            ),
        ],
      ),
    );
  }
}

class _MissionsList extends ConsumerWidget {
  const _MissionsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AsyncValueView<List<Mission>>(
      value: ref.watch(activeMissionsProvider),
      isEmpty: (items) => items.isEmpty,
      onRetry: () => ref.invalidate(activeMissionsProvider),
      empty: EmptyState(
        icon: LucideIcons.flag,
        title: l10n.actEmptyTitle,
        body: l10n.actEmptyBody,
      ),
      data: (items) => Column(
        children: [
          for (final mission in items)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.sm),
              child: MissionCard(mission: mission),
            ),
        ],
      ),
    );
  }
}

class _EventsList extends ConsumerWidget {
  const _EventsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AsyncValueView<List<CommunityEvent>>(
      value: ref.watch(upcomingEventsProvider),
      isEmpty: (items) => items.isEmpty,
      onRetry: () => ref.invalidate(upcomingEventsProvider),
      empty: EmptyState(
        icon: LucideIcons.calendarDays,
        title: l10n.actEmptyTitle,
        body: l10n.actEmptyBody,
      ),
      data: (items) => Column(
        children: [
          for (final event in items)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.sm),
              child: EventCard(event: event),
            ),
        ],
      ),
    );
  }
}
