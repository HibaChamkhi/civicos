import 'package:civicos/features/volunteering/domain/opportunity.dart';

/// Whether the person has said they're coming.
enum RsvpStatus { none, going, waitlist }

/// A community event anyone can join.
class CommunityEvent {
  const CommunityEvent({
    required this.id,
    required this.title,
    required this.organizerName,
    required this.category,
    required this.startsAt,
    required this.placeName,
    required this.capacity,
    required this.going,
    required this.rsvp,
  });

  final String id;
  final String title;
  final String organizerName;
  final ImpactCategory category;
  final DateTime startsAt;
  final String placeName;
  final int capacity;
  final int going;
  final RsvpStatus rsvp;

  int get spotsLeft => (capacity - going).clamp(0, capacity);

  bool get isFull => spotsLeft == 0;
}
