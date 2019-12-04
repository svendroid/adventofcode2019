import 'dart:io';
import 'dart:math';

class Day3 {
  final size;
  final grid;
  int minDistance;
  final Point center;

  static final int charDot = '.'.codeUnits.first;
  static final int char0 = '0'.codeUnits.first;
  static final int charX = 'X'.codeUnits.first;
  static final int charAsterisk = '*'.codeUnits.first;

  int stepCounter = 0;

  Day3(this.size)
      : this.grid = List<List<int>>.generate(
            size, (i) => List<int>.generate(size, (j) => charDot)),
        this.center = Point(size ~/ 2, size ~/ 2) {
    grid[center.y][center.x] = 0;
  }

  int part1(List<String> wires) {
    for (int i = 0; i < wires.length; i++) {
      var wire = wires[i];
      Point pos = Point(size ~/ 2, size ~/ 2);

      wire.split(',').forEach((cmd) => () {
            int steps = int.parse(cmd.substring(1));
            switch (cmd[0]) {
              case 'U':
                pos = Point(pos.x, pos.y - 1);
                for (int y = pos.y; y > pos.y - steps; y--) {
                  draw(y, pos.x, i);
                }
                pos = Point(pos.x, pos.y - steps + 1);
                break;
              case 'R':
                pos = Point(pos.x + 1, pos.y);
                for (int x = pos.x; x < pos.x + steps; x++) {
                  draw(pos.y, x, i);
                }
                pos = Point(pos.x + steps - 1, pos.y);
                break;
              case 'L':
                pos = Point(pos.x - 1, pos.y);
                for (int x = pos.x; x > pos.x - steps; x--) {
                  draw(pos.y, x, i);
                }
                pos = Point(pos.x - steps + 1, pos.y);
                break;
              case 'D':
                pos = Point(pos.x, pos.y + 1);
                for (int y = pos.y; y < pos.y + steps; y++) {
                  draw(y, pos.x, i);
                }
                pos = Point(pos.x, pos.y + steps - 1);
                break;
            }
          }());
    }
    if(size < 200){
      printGrid(grid);
    }

    return minDistance;
  }

  int part2(List<String> wires) {
    part1(wires);
    countSteps(wires);
    int minSteps;

    counts.forEach((key, value) => (){
      if(minSteps == null){
        minSteps = value;
      }
      minSteps = min(value, minSteps);
    }());
    return minSteps;
  }

  void countSteps(List<String> wires) {
    for (int i = 0; i < wires.length; i++) {
      var wire = wires[i];
      Point pos = Point(size ~/ 2, size ~/ 2);
      stepCounter = 0;
      wire.split(',').forEach((cmd) => () {
            int steps = int.parse(cmd.substring(1));
            switch (cmd[0]) {
              case 'U':
                pos = Point(pos.x, pos.y - 1);
                for (int y = pos.y; y > pos.y - steps; y--) {
                  draw2(y, pos.x, i);
                }
                pos = Point(pos.x, pos.y - steps + 1);
                break;
              case 'R':
                pos = Point(pos.x + 1, pos.y);
                for (int x = pos.x; x < pos.x + steps; x++) {
                  draw2(pos.y, x, i);
                }
                pos = Point(pos.x + steps - 1, pos.y);
                break;
              case 'L':
                pos = Point(pos.x - 1, pos.y);
                for (int x = pos.x; x > pos.x - steps; x--) {
                  draw2(pos.y, x, i);
                }
                pos = Point(pos.x - steps + 1, pos.y);
                break;
              case 'D':
                pos = Point(pos.x, pos.y + 1);
                for (int y = pos.y; y < pos.y + steps; y++) {
                  draw2(y, pos.x, i);
                }
                pos = Point(pos.x, pos.y + steps - 1);
                break;
            }
          }());
    }
    //printGrid(grid);
  }

  Map<Point, int> counts = Map();

  void draw2(int y, int x, int symbol) {
    stepCounter += 1;
    if (grid[y][x] == charX) {
      var p = Point(x, y);
      if (counts.containsKey(p)) {
        counts[p] = counts[p] + stepCounter;
      } else {
        counts[p] = stepCounter;
      }
    }
  }

  void draw(int y, int x, int symbol) {
    if (grid[y][x] == charDot || grid[y][x] == char0 || grid[y][x] == symbol) {
      grid[y][x] = symbol;
    } else {
      int manhattenDistance = (y - center.y).abs() + (x - center.x).abs();
      stdout.write("$x, $y: $manhattenDistance\n");
      stdout.write("$center\n");
      if (minDistance == null) {
        minDistance = manhattenDistance;
      } else {
        minDistance = min(minDistance, manhattenDistance);
      }
      grid[y][x] = charX;
    }
  }

  void printGrid(grid) {
    for (var line in grid) {
      for (var char in line) {
        stdout.write(String.fromCharCode(char));
      }
      stdout.write('\n');
    }
  }
}
