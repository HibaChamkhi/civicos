import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/utils/relative_time.dart';
import 'package:civicos/features/community/domain/feed_item.dart';
import 'package:civicos/features/community/presentation/feed_labels.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// One community outcome. The feed is chronological and carries only things
/// that actually happened, never free-form posts.
class FeedTile extends StatelessWidget {
  const FeedTile({required this.item, super.key});

  final FeedItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.civic;
    final tone = c.toneColor(feedKindTone(item.kind));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Space.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: c.surfaceSunken,
              shape: BoxShape.circle,
            ),
            child: Icon(feedKindIcon(item.kind), size: 18, color: tone),
          ),
          const SizedBox(width: Space.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.text, style: context.type.body),
                const SizedBox(height: Space.xxs),
                Wrap(
                  spacing: Space.sm,
                  runSpacing: Space.xxs,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${item.placeName} · '
                      '${relativeTime(l10n, item.happenedAt)}',
                      style: context.type.footnote,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.partyPopper,
                          size: 14,
                          color: item.celebratedByMe
                              ? c.accentText
                              : c.textMuted,
                        ),
                        const SizedBox(width: Space.xxs),
                        Flexible(
                          child: Text(
                            l10n.celebrations(item.celebrations),
                            style: context.type.footnote,
                          ),
                        ),
                      ],
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
