import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/utils/relative_time.dart';
import 'package:civicos/features/volunteering/domain/opportunity.dart';
import 'package:civicos/features/volunteering/presentation/opportunity_labels.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// One volunteering opportunity, with the reason it was matched to you.
class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    required this.opportunity,
    super.key,
    this.showMatch = true,
  });

  final Opportunity opportunity;

  /// Hidden when the list isn't ordered by match.
  final bool showMatch;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.civic;
    final percent = (opportunity.matchScore * 100).round();

    return CivicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: Space.xs,
            runSpacing: Space.xs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (showMatch)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Space.xs,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: c.accentWash,
                    borderRadius: BorderRadius.circular(Radii.pill),
                  ),
                  child: Text(
                    l10n.matchPercent(percent),
                    style: context.type.footnote.copyWith(
                      color: c.accentText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              _Tag(
                icon: impactCategoryIcon(opportunity.category),
                label: impactCategoryLabel(l10n, opportunity.category),
              ),
              _Tag(
                icon: LucideIcons.star,
                label: difficultyLabel(l10n, opportunity.difficulty),
              ),
            ],
          ),
          const SizedBox(height: Space.sm),
          Text(opportunity.title, style: context.type.headline),
          const SizedBox(height: 2),
          Text(opportunity.organizationName, style: context.type.footnote),
          const SizedBox(height: Space.xs),
          Text(
            opportunity.summary,
            style: context.type.callout.copyWith(color: c.textMuted),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          if (showMatch) ...[
            const SizedBox(height: Space.xs),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(LucideIcons.sparkles, size: 14, color: c.accentText),
                const SizedBox(width: Space.xxs),
                Expanded(
                  child: Text(
                    opportunity.matchReason,
                    style: context.type.footnote.copyWith(color: c.accentText),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: Space.sm),
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.xxs,
            children: [
              _Tag(
                icon: LucideIcons.calendar,
                label: relativeFuture(l10n, opportunity.startsAt),
                muted: true,
              ),
              _Tag(
                icon: LucideIcons.clock,
                label: durationLabel(l10n, opportunity.durationMinutes),
                muted: true,
              ),
              _Tag(
                icon: opportunity.isRemote
                    ? LucideIcons.laptop
                    : LucideIcons.mapPin,
                label: opportunity.isRemote
                    ? l10n.remote
                    : opportunity.placeName,
                muted: true,
              ),
            ],
          ),
          const SizedBox(height: Space.xs),
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.joinedOfNeeded(
                    opportunity.volunteersJoined,
                    opportunity.volunteersNeeded,
                  ),
                  style: context.type.footnote,
                ),
              ),
              Text(
                l10n.spotsLeft(opportunity.spotsLeft),
                style: context.type.footnote.copyWith(
                  color: opportunity.isFull ? c.textMuted : c.text,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.icon, required this.label, this.muted = false});

  final IconData icon;
  final String label;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final color = muted ? context.civic.textMuted : context.civic.text;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: Space.xxs),
        Flexible(
          child: Text(
            label,
            style: context.type.footnote.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
