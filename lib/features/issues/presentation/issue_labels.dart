import 'package:civicos/app/theme/tone.dart';
import 'package:civicos/features/issues/domain/issue.dart';
import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

String issueStatusLabel(AppLocalizations l10n, IssueStatus status) {
  return switch (status) {
    IssueStatus.reported => l10n.statusReported,
    IssueStatus.underReview => l10n.statusUnderReview,
    IssueStatus.accepted => l10n.statusAccepted,
    IssueStatus.assigned => l10n.statusAssigned,
    IssueStatus.inProgress => l10n.statusInProgress,
    IssueStatus.resolved => l10n.statusResolved,
    IssueStatus.declined => l10n.statusDeclined,
  };
}

/// Color is a reinforcement only; the badge also carries this icon, the
/// label above, and the step ticks.
IconData issueStatusIcon(IssueStatus status) {
  return switch (status) {
    IssueStatus.reported => LucideIcons.circleDot,
    IssueStatus.underReview => LucideIcons.search,
    IssueStatus.accepted => LucideIcons.check,
    IssueStatus.assigned => LucideIcons.userCheck,
    IssueStatus.inProgress => LucideIcons.hammer,
    IssueStatus.resolved => LucideIcons.circleCheck,
    IssueStatus.declined => LucideIcons.circleX,
  };
}

Tone issueStatusTone(IssueStatus status) {
  return switch (status) {
    IssueStatus.reported => Tone.neutral,
    IssueStatus.underReview => Tone.warning,
    IssueStatus.accepted => Tone.info,
    IssueStatus.assigned => Tone.info,
    IssueStatus.inProgress => Tone.accent,
    IssueStatus.resolved => Tone.success,
    IssueStatus.declined => Tone.danger,
  };
}

IconData issueCategoryIcon(IssueCategory category) {
  return switch (category) {
    IssueCategory.lighting => LucideIcons.lightbulbOff,
    IssueCategory.waste => LucideIcons.trash2,
    IssueCategory.road => LucideIcons.construction,
    IssueCategory.water => LucideIcons.droplet,
    IssueCategory.accessibility => LucideIcons.accessibility,
    IssueCategory.safety => LucideIcons.shieldAlert,
    IssueCategory.publicSpace => LucideIcons.trees,
    IssueCategory.other => LucideIcons.circleAlert,
  };
}
