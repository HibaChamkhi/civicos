import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/features/events/data/events_repository.dart';
import 'package:civicos/features/events/domain/community_event.dart';
import 'package:civicos/features/events/presentation/widgets/event_card.dart';
import 'package:civicos/features/issues/data/issues_repository.dart';
import 'package:civicos/features/issues/domain/issue.dart';
import 'package:civicos/features/issues/presentation/widgets/issue_card.dart';
import 'package:civicos/features/volunteering/data/opportunities_repository.dart';
import 'package:civicos/features/volunteering/domain/opportunity.dart';
import 'package:civicos/features/volunteering/presentation/widgets/opportunity_card.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/system/async_value_view.dart';
import 'package:civicos/shared/widgets/ui/civic_chip.dart';
import 'package:civicos/shared/widgets/ui/civic_scaffold.dart';
import 'package:civicos/shared/widgets/ui/empty_state.dart';
import 'package:civicos/shared/widgets/ui/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum _NearbyFilter { all, issues, volunteering, events }

/// Everything happening around you. Shown as a list until the map itself
/// arrives with location support.
class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  _NearbyFilter _filter = _NearbyFilter.all;

  bool _shows(_NearbyFilter section) =>
      _filter == _NearbyFilter.all || _filter == section;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final showIssues = _shows(_NearbyFilter.issues);
    final showVolunteering = _shows(_NearbyFilter.volunteering);
    final showEvents = _shows(_NearbyFilter.events);

    String labelFor(_NearbyFilter filter) => switch (filter) {
      _NearbyFilter.all => l10n.filterAll,
      _NearbyFilter.issues => l10n.filterIssues,
      _NearbyFilter.volunteering => l10n.filterVolunteering,
      _NearbyFilter.events => l10n.filterEvents,
    };

    return CivicScaffold(
      title: l10n.mapTitle,
      subtitle: l10n.mapListNote,
      children: [
        const SizedBox(height: Space.sm),
        Wrap(
          spacing: Space.xs,
          runSpacing: Space.xs,
          children: [
            for (final filter in _NearbyFilter.values)
              CivicChip(
                label: labelFor(filter),
                selected: _filter == filter,
                onSelected: (_) => setState(() => _filter = filter),
              ),
          ],
        ),
        if (showIssues) ...[
          if (_filter == _NearbyFilter.all) SectionHeader(l10n.filterIssues),
          if (_filter != _NearbyFilter.all) const SizedBox(height: Space.md),
          AsyncValueView<List<Issue>>(
            value: ref.watch(nearbyIssuesProvider),
            isEmpty: (items) => items.isEmpty,
            onRetry: () => ref.invalidate(nearbyIssuesProvider),
            empty: _emptyFilter(context),
            data: (items) => Column(
              children: [
                for (final issue in items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: Space.sm),
                    child: IssueCard(issue: issue),
                  ),
              ],
            ),
          ),
        ],
        if (showVolunteering) ...[
          if (_filter == _NearbyFilter.all)
            SectionHeader(l10n.filterVolunteering),
          if (_filter != _NearbyFilter.all) const SizedBox(height: Space.md),
          AsyncValueView<List<Opportunity>>(
            value: ref.watch(allOpportunitiesProvider),
            isEmpty: (items) => items.isEmpty,
            onRetry: () => ref.invalidate(allOpportunitiesProvider),
            empty: _emptyFilter(context),
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
          ),
        ],
        if (showEvents) ...[
          if (_filter == _NearbyFilter.all) SectionHeader(l10n.filterEvents),
          if (_filter != _NearbyFilter.all) const SizedBox(height: Space.md),
          AsyncValueView<List<CommunityEvent>>(
            value: ref.watch(upcomingEventsProvider),
            isEmpty: (items) => items.isEmpty,
            onRetry: () => ref.invalidate(upcomingEventsProvider),
            empty: _emptyFilter(context),
            data: (items) => Column(
              children: [
                for (final event in items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: Space.sm),
                    child: EventCard(event: event),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _emptyFilter(BuildContext context) {
    final l10n = context.l10n;
    return EmptyState(
      icon: LucideIcons.compass,
      title: l10n.nearbyEmptyTitle,
      body: l10n.nearbyEmptyBody,
      actionLabel: l10n.filterAll,
      onAction: () => setState(() => _filter = _NearbyFilter.all),
    );
  }
}
