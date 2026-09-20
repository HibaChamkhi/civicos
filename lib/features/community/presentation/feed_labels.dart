import 'package:civicos/app/theme/tone.dart';
import 'package:civicos/features/community/domain/feed_item.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

IconData feedKindIcon(FeedKind kind) {
  return switch (kind) {
    FeedKind.issueResolved => LucideIcons.circleCheck,
    FeedKind.volunteeringDone => LucideIcons.handHeart,
    FeedKind.eventJoined => LucideIcons.users,
    FeedKind.missionStarted => LucideIcons.flag,
    FeedKind.badgeEarned => LucideIcons.medal,
  };
}

Tone feedKindTone(FeedKind kind) {
  return switch (kind) {
    FeedKind.issueResolved => Tone.success,
    FeedKind.volunteeringDone => Tone.accent,
    FeedKind.eventJoined => Tone.info,
    FeedKind.missionStarted => Tone.accent,
    FeedKind.badgeEarned => Tone.accent,
  };
}
