class Day5 {
  List<int> program;
  int opcode;
  int param1Mode;
  int param2Mode;
  int param3Mode;
  int nextIdx = 0;

  List<int> outputs = [];

  Map<String, List<int>> part1(List<int> program, {int input}) {
    this.program = program;

    do {
      int opcodeFull = program[nextIdx];

      opcode = opcodeFull % 100;
      param1Mode = (opcodeFull ~/ 100) % 10;
      param2Mode = (opcodeFull ~/ 1000) % 10;
      param3Mode = (opcodeFull ~/ 10000) % 10;

      //print("$opcodeFull: opcode $opcode, 1P:$param1Mode,2P:$param2Mode,3P:$param3Mode");

      switch (opcode) {
        case 1: //ADD
          program[_getParam(3, 1, nextIdx)] = param1 + param2;
          nextIdx += 4;
          break;
        case 2: //MULTIPLY
          program[_getParam(3, 1, nextIdx)] = param1 * param2;
          nextIdx += 4;
          break;
        case 3: //INPUT
          program[_getParam(1, 1, nextIdx)] = input;
          print("IN: $input");
          nextIdx += 2;
          break;
        case 4: //OUTPUT
          print("OUT: $param1");
          outputs.add(param1);
          nextIdx += 2;
          break;
        case 5: //jump-if-true
          if (param1 != 0) {
            nextIdx = param2;
          } else {
            nextIdx += 3;
          }
          break;
        case 6: //jump-if-false
          if (param1 == 0) {
            nextIdx = param2;
          } else {
            nextIdx += 3;
          }
          break;
        case 7: //less than
          var value = param1 < param2 ? 1 : 0;
          program[_getParam(3, 1, nextIdx)] = value;
          nextIdx += 4;
          break;
        case 8:
          var value = param1 == param2 ? 1 : 0;
          program[_getParam(3, 1, nextIdx)] = value;
          nextIdx += 4;
          break;
        case 99:
          //do nothing
          break;
        default:
          throw ("unknown opcode $opcode");
          break;
      }
    } while (opcode != 99);

    return {'program': program, 'outputs': outputs};
  }

  get param1 => _getParam(1, param1Mode, nextIdx);

  get param2 => _getParam(2, param2Mode, nextIdx);

  get param3 => _getParam(3, param3Mode, nextIdx);

  int _getParam(int num, int mode, int idx) {
    if (mode == 0) {
      //position mode
      return program[program[idx + num]];
    } else if (mode == 1) {
      //immediate
      return program[idx + num];
    } else {
      throw ("unknown param mode");
    }
  }
}
