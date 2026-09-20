/// What happened. The feed only carries real outcomes, not free-form posts.
enum FeedKind {
  issueResolved,
  volunteeringDone,
  eventJoined,
  missionStarted,
  badgeEarned,
}

/// One entry in the community feed.
class FeedItem {
  const FeedItem({
    required this.id,
    required this.kind,
    required this.text,
    required this.placeName,
    required this.happenedAt,
    required this.celebrations,
    required this.celebratedByMe,
  });

  final String id;
  final FeedKind kind;

  /// Ready-to-show sentence, e.g. "The community resolved the water leak".
  final String text;
  final String placeName;
  final DateTime happenedAt;
  final int celebrations;
  final bool celebratedByMe;
}
