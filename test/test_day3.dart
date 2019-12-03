import 'dart:io';

import 'package:advent_of_code_2019/day3.dart';
import 'package:test/test.dart';

void main() {
  group("Part 1", () {
    test('example1', () {
      var wire1 = "R8,U5,L5,D3";
      var wire2 = "U7,R6,D4,L4";
      expect(Day3(21).part1([wire1, wire2]), 6);
    });

    test('down example', () {
      var wire1 = "R8,D5,L5,D3";
      var wire2 = "D7,R6,D4,L4";
      expect(Day3(41).part1([wire1, wire2]), 10);
    });

    test('down left example', () {
      var wire1 = "L8,D5,R5,D3";
      var wire2 = "D7,L6,D4,R4";
      expect(Day3(41).part1([wire1, wire2]), 10);
    });

    test('up left example', () {
      var wire1 = "L8,U5,R5,D3";
      var wire2 = "U7,L6,D4,R4";
      expect(Day3(21).part1([wire1, wire2]), 6);
    });

    test('example2', () {
      var wire1 = "R75,D30,R83,U83,L12,D49,R71,U7,L72";
      var wire2 = "U62,R66,U55,R34,D71,R55,D58,R83";
      expect(Day3(501).part1([wire1, wire2]), 159);
    });

    test('example3', () {
      var wire1 = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51";
      var wire2 = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7";
      expect(Day3(401).part1([wire1, wire2]), 135);
    });

    test('solution', () {
      var wires = File('./inputs/day3.txt').readAsLinesSync();
      expect(Day3(40001).part1(wires), 1337);
    });
  });

  group("Part 2", ()
  {
    test('example1', () {
      var wire1 = "R8,U5,L5,D3";
      var wire2 = "U7,R6,D4,L4";
      expect(Day3(21).part2([wire1, wire2]), 30);
    });

    test('example2', () {
      var wire1 = "R75,D30,R83,U83,L12,D49,R71,U7,L72";
      var wire2 = "U62,R66,U55,R34,D71,R55,D58,R83";
      expect(Day3(501).part2([wire1, wire2]), 610);
    });

    test('example3', () {
      var wire1 = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51";
      var wire2 = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7";
      expect(Day3(401).part2([wire1, wire2]), 410);
    });

    test('solution', () {
      var wires = File('./inputs/day3.txt').readAsLinesSync();
      expect(Day3(40001).part2(wires), 65356);
    });
  });


}
