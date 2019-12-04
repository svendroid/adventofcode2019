import 'package:advent_of_code_2019/day4.dart';
import 'package:test/test.dart';

void main() {
  group("Part 1", () {
    test('example1', () {
      expect(Day4().part1([111111]), 1);
    });

    test('containsDoubleDigit', () {
      expect(Day4().containsDoubleDigit(111111), isTrue);
      expect(Day4().containsDoubleDigit(123456), isFalse);
      expect(Day4().containsDoubleDigit(122456), isTrue);
    });

    test('containsDecreasingDigits', () {
      expect(Day4().containsDecreasingDigits(223450), isTrue);
      expect(Day4().containsDecreasingDigits(223456), isFalse);
    });

    test('all examples', () {
      expect(Day4().part1([111111, 122345, 111123, 135679, 223450, 123789]), 3);
    });

    test('solution', () {
      var start = 245318;
      var end = 765747;
      var passwords = List<int>.generate(end - start - 1, (i) => start + i + 1);
      expect(Day4().part1(passwords), 1079);
    });
  });

  group("Part 2", () {
    test('containsDoubleDigitButNotInAGroup', () {
      expect(Day4().containsDoubleDigitButNotInAGroup(112233), isTrue);
      expect(Day4().containsDoubleDigitButNotInAGroup(123444), isFalse);
      expect(Day4().containsDoubleDigitButNotInAGroup(111122), isTrue);
    });

    test('part2 solution', () {
      var start = 245318;
      var end = 765747;
      var passwords = List<int>.generate(end - start - 1, (i) => start + i + 1);
      expect(Day4().part2(passwords), 699);
    });
  });
}
