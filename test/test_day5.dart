import 'dart:io';

import 'package:advent_of_code_2019/day5.dart';
import 'package:test/test.dart';

void main() {
  group("Part 1", () {
    test('output example', () {
      expect(Day5().part1([3, 0, 4, 0, 99], input: 5)['outputs'], [5]);
    });

    test('example1', () {
      expect(Day5().part1([1002, 4, 3, 4, 33])['program'], [1002, 4, 3, 4, 99]);
    });

    test("Negative values", () {
      expect(Day5().part1([1101, 100, -1, 4, 0])['program'],
          [1101, 100, -1, 4, 99]);
    });

    test('solution', () {
      var input = File('./inputs/day5.txt').readAsStringSync();
      var program =
          input.split(',').map((string) => int.parse(string)).toList();
      expect(Day5().part1(program, input: 1)['outputs'],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 15508323]);
    });
  });

  group("Part 2", () {
    test('equal to 8', () {
      expect(
          Day5()
              .part1([3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8], input: 8)['outputs'],
          [1]);
    });
    test('4 not equal to 8', () {
      expect(
          Day5()
              .part1([3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8], input: 4)['outputs'],
          [0]);
    });
    test('less than 8', () {
      expect(
          Day5()
              .part1([3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8], input: 7)['outputs'],
          [1]);
      expect(
          Day5().part1([3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8],
              input: 10)['outputs'],
          [0]);
    });
    test('equal 8 immediate', () {
      expect(
          Day5().part1([3, 3, 1108, -1, 8, 3, 4, 3, 99], input: 7)['outputs'],
          [0]);
      expect(
          Day5().part1([3, 3, 1108, -1, 8, 3, 4, 3, 99], input: 8)['outputs'],
          [1]);
    });
    test('less than 8 immediate', () {
      expect(
          Day5().part1([3, 3, 1107, -1, 8, 3, 4, 3, 99], input: 7)['outputs'],
          [1]);
      expect(
          Day5().part1([3, 3, 1107, -1, 8, 3, 4, 3, 99], input: 10)['outputs'],
          [0]);
    });

    group("jump tests", () {
      test('is zero - position mode', () {
        expect(
            Day5().part1(
                [3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9],
                input: 0)['outputs'],
            [0]);
      });

      test('is NOT zero - position mode', () {
        expect(
            Day5().part1(
                [3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9],
                input: 7)['outputs'],
            [1]);
      });

      test('is zero - immediate mode', () {
        expect(
            Day5().part1([3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1],
                input: 0)['outputs'],
            [0]);
      });

      test('is NOT zero - immediate mode', () {
        expect(
            Day5().part1([3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1],
                input: 7)['outputs'],
            [1]);
      });
    });

    test('solution part2', () {
      var input = File('./inputs/day5.txt').readAsStringSync();
      var program =
          input.split(',').map((string) => int.parse(string)).toList();
      expect(Day5().part1(program, input: 5)['outputs'], [9006327]);
    });
  });

  group("Day 2 Part 1 Tests", () {
    test('example1', () {
      expect(Day5().part1([1, 0, 0, 0, 99])['program'], [2, 0, 0, 0, 99]);
    });

    test('example2', () {
      expect(Day5().part1([2, 3, 0, 3, 99])['program'], [2, 3, 0, 6, 99]);
    });

    test('example3', () {
      expect(
          Day5().part1([2, 4, 4, 5, 99, 0])['program'], [2, 4, 4, 5, 99, 9801]);
    });

    test('example4', () {
      expect(Day5().part1([1, 1, 1, 4, 99, 5, 6, 0, 99])['program'],
          [30, 1, 1, 4, 2, 5, 6, 0, 99]);
    });
  });
}
