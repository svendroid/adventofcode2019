import 'dart:io';

import 'package:advent_of_code_2019/day2.dart';
import 'package:test/test.dart';

void main() {
  group("Part 1", () {
    test('example1', () {
      expect(Day2().part1([1, 0, 0, 0, 99]), [2, 0, 0, 0, 99]);
    });

    test('example2', () {
      expect(Day2().part1([2, 3, 0, 3, 99]), [2, 3, 0, 6, 99]);
    });

    test('example3', () {
      expect(Day2().part1([2, 4, 4, 5, 99, 0]), [2, 4, 4, 5, 99, 9801]);
    });

    test('example4', () {
      expect(Day2().part1([1, 1, 1, 4, 99, 5, 6, 0, 99]),
          [30, 1, 1, 4, 2, 5, 6, 0, 99]);
    });

    test('solution', () {
      var input = File('./inputs/day2.txt').readAsStringSync();
      var program =
          input.split(',').map((string) => int.parse(string)).toList();

      program[1] = 12;
      program[2] = 2;

      expect(Day2().part1(program)[0], 3224742);
    });
  });

  test('Part 2 solution', () {
    var input = File('./inputs/day2.txt').readAsStringSync();
    var program = input.split(',').map((string) => int.parse(string)).toList();

    expect(Day2().part2(program, 19690720), 7960);
  });
}
