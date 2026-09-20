import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/app/theme/tone.dart';
import 'package:civicos/features/events/domain/community_event.dart';
import 'package:civicos/features/volunteering/presentation/opportunity_labels.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// One community event, with the date block people scan for first.
class EventCard extends StatelessWidget {
  const EventCard({required this.event, super.key});

  final CommunityEvent event;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.civic;
    final locale = Localizations.localeOf(context).toLanguageTag();

    return CivicCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            padding: const EdgeInsets.symmetric(vertical: Space.xs),
            decoration: BoxDecoration(
              color: c.accentWash,
              borderRadius: BorderRadius.circular(Radii.md),
            ),
            child: Column(
              children: [
                Text(
                  DateFormat.d(locale).format(event.startsAt),
                  style: context.type.title2.copyWith(color: c.accentText),
                ),
                Text(
                  DateFormat.MMM(locale).format(event.startsAt).toUpperCase(),
                  style: context.type.label.copyWith(color: c.accentText),
                ),
              ],
            ),
          ),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.title, style: context.type.headline),
                const SizedBox(height: 2),
                Text(event.organizerName, style: context.type.footnote),
                const SizedBox(height: Space.xs),
                Wrap(
                  spacing: Space.sm,
                  runSpacing: Space.xxs,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _Meta(
                      icon: LucideIcons.clock,
                      text: DateFormat.Hm(locale).format(event.startsAt),
                    ),
                    _Meta(icon: LucideIcons.mapPin, text: event.placeName),
                    _Meta(
                      icon: impactCategoryIcon(event.category),
                      text: impactCategoryLabel(l10n, event.category),
                    ),
                  ],
                ),
                const SizedBox(height: Space.xs),
                Wrap(
                  spacing: Space.xs,
                  runSpacing: Space.xs,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      l10n.eventGoingCount(event.going),
                      style: context.type.footnote,
                    ),
                    if (event.rsvp == RsvpStatus.going)
                      StatusBadge(
                        label: l10n.eventGoing,
                        icon: LucideIcons.check,
                        tone: Tone.success,
                      )
                    else if (event.rsvp == RsvpStatus.waitlist)
                      StatusBadge(
                        label: l10n.eventWaitlist,
                        icon: LucideIcons.clock,
                        tone: Tone.warning,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: context.civic.textMuted),
        const SizedBox(width: Space.xxs),
        Flexible(child: Text(text, style: context.type.footnote)),
      ],
    );
  }
}
