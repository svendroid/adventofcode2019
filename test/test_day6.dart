import 'dart:io';

import 'package:advent_of_code_2019/day6.dart';
import 'package:test/test.dart';

void main() {
  group("Part 1", () {
    test('example', () {
      expect(
          Day6().orbitMapChecksum(
              'COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L'),
          42);
    });

    test('solution', () {
      var input = File('./inputs/day6.txt').readAsStringSync();
      expect(Day6().orbitMapChecksum(input), 147807);
    });
  });

  group("Part 2", () {
    test("example", () {
      var input =
          "COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L\nK)YOU\nI)SAN";

      expect(Day6().minDistanceBetweenYouAndSanta(input), 4);
    });

    test('solution', () {
      var input = File('./inputs/day6.txt').readAsStringSync();
      expect(Day6().minDistanceBetweenYouAndSanta(input), 229);
    });
  });
}
