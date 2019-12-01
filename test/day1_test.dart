import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code_2019/day1.dart';
import 'package:test/test.dart';

void main() {
  group("Part 1", () {
    test('example 12', () {
      var stream = Stream.fromIterable([12]);
      var part1 = Day1().part1(stream);
      part1.then(expectAsync1((int sum) {
        expect(sum, 2);
      }));
    });

    test('example 14', () {
      var stream = Stream.fromIterable([14]);
      var part1 = Day1().part1(stream);
      part1.then(expectAsync1((int sum) {
        expect(sum, 2);
      }));
    });

    test('example 100756', () {
      var stream = Stream.fromIterable([100756]);
      var part1 = Day1().part1(stream);
      part1.then(expectAsync1((int sum) {
        expect(sum, 33583);
      }));
    });

    test('example 1969', () {
      var stream = Stream.fromIterable([1969]);
      var part1 = Day1().part1(stream);
      part1.then(expectAsync1((int sum) {
        expect(sum, 654);
      }));
    });

    test('solution', () {
      var stream = File('./inputs/day1.txt')
          .openRead()
          .transform(utf8.decoder)
          .transform(LineSplitter())
          .map<int>((String line) => () {
                return int.parse(line);
              }());

      var day1 = Day1();

      var part1 = day1.part1(stream);
      part1.then(expectAsync1((int sum) {
        expect(sum, 3160932);
      }));
    });
  });

  group("Part 2", () {
    test('example 14', () {
      var stream = Stream.fromIterable([14]);
      var part2 = Day1().part2(stream);
      part2.then(expectAsync1((int sum) {
        expect(sum, 2);
      }));
    });

    test('example 100756', () {
      var stream = Stream.fromIterable([100756]);
      var part2 = Day1().part2(stream);
      part2.then(expectAsync1((int sum) {
        expect(sum, 50346);
      }));
    });

    test('example 1969', () {
      var stream = Stream.fromIterable([1969]);
      var part2 = Day1().part2(stream);
      part2.then(expectAsync1((int sum) {
        expect(sum, 966);
      }));
    });

    test('solution', (){
      var stream = File('./inputs/day1.txt')
          .openRead()
          .transform(utf8.decoder)
          .transform(LineSplitter())
          .map<int>((String line) => () {
        return int.parse(line);
      }());

      var day1 = Day1();

      var part2 = day1.part2(stream);
      part2.then(expectAsync1((int sum) {
        expect(sum, 4738549);
      }));
    });
  });

}
