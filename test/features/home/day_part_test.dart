import 'package:civicos/features/home/domain/day_part.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DateTime at(int hour, [int minute = 0]) =>
      DateTime(2026, 9, 11, hour, minute);

  test('greets by part of day', () {
    expect(DayPart.of(at(0)), DayPart.morning);
    expect(DayPart.of(at(11, 59)), DayPart.morning);
    expect(DayPart.of(at(12)), DayPart.afternoon);
    expect(DayPart.of(at(17, 59)), DayPart.afternoon);
    expect(DayPart.of(at(18)), DayPart.evening);
    expect(DayPart.of(at(23, 59)), DayPart.evening);
  });
}
