import 'package:civicos/app/theme/app_theme.dart';
import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/utils/relative_time.dart';
import 'package:civicos/features/issues/domain/issue.dart';
import 'package:civicos/features/issues/presentation/issue_labels.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:civicos/shared/widgets/ui/civic_card.dart';
import 'package:civicos/shared/widgets/ui/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// One reported issue: status, what and where, and how many neighbors
/// have backed it.
class IssueCard extends StatelessWidget {
  const IssueCard({required this.issue, super.key});

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.civic;
    final step = issue.status.step;

    return CivicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: Space.xs,
            runSpacing: Space.xs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              StatusBadge(
                label: issueStatusLabel(l10n, issue.status),
                icon: issueStatusIcon(issue.status),
                tone: issueStatusTone(issue.status),
                step: step,
                totalSteps: step == null ? null : IssueStatus.totalSteps,
              ),
              Text(
                distanceLabel(l10n, issue.distanceMeters),
                style: context.type.footnote,
              ),
            ],
          ),
          const SizedBox(height: Space.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                issueCategoryIcon(issue.category),
                size: 20,
                color: c.textMuted,
              ),
              const SizedBox(width: Space.xs),
              Expanded(
                child: Text(issue.title, style: context.type.headline),
              ),
            ],
          ),
          const SizedBox(height: Space.xxs),
          Text(
            issue.summary,
            style: context.type.callout.copyWith(color: c.textMuted),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Space.sm),
          Text(
            '${issue.placeName} · ${relativeTime(l10n, issue.reportedAt)}',
            style: context.type.footnote,
          ),
          const SizedBox(height: Space.xxs),
          Wrap(
            spacing: Space.sm,
            runSpacing: Space.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _Meta(
                icon: LucideIcons.users,
                text: l10n.supporters(issue.supporters),
              ),
              Text(
                issue.reporterName == null
                    ? l10n.reportedByNeighbor
                    : l10n.reportedBy(issue.reporterName!),
                style: context.type.footnote,
              ),
            ],
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
        // Flexible so the label wraps at large text sizes instead of
        // overflowing its line.
        Flexible(child: Text(text, style: context.type.footnote)),
      ],
    );
  }
}
