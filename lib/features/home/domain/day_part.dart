/// Part of the day, used for the greeting on Home.
enum DayPart {
  morning,
  afternoon,
  evening;

  /// Morning until noon, afternoon until 6 pm, evening after that.
  static DayPart of(DateTime time) {
    if (time.hour < 12) return DayPart.morning;
    if (time.hour < 18) return DayPart.afternoon;
    return DayPart.evening;
  }
}
