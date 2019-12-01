import 'dart:async';

class Day1 {
  Future<int> part1(Stream<int> masses) async {
    return masses.map((int mass) => mass ~/ 3 - 2).reduce((a, b) => a + b);
  }

  int calcFuel(int mass) {
    var fuel = mass ~/ 3 - 2;

    if (fuel <= 0) {
      return 0;
    } else {
      return fuel + calcFuel(fuel);
    }
  }

  Future<int> part2(Stream<int> masses) async {
    return masses.map((int mass) => calcFuel(mass)).reduce((a, b) => a + b);
  }
}
