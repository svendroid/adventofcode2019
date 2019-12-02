class Day2 {
  List<int> part1(List<int> program) {
    int nextIdx = 0;
    int nextOpcode = program[nextIdx];
    while(nextOpcode != 99){
      int opcode = program[nextIdx];
      int input1 = program[program[nextIdx + 1]];
      int input2 = program[program[nextIdx + 2]];
      int outputPos = program[nextIdx + 3];

      switch(opcode){
        case 1://ADD
          program[outputPos] = input1 + input2;
          break;
        case 2:
          program[outputPos] = input1 * input2;
          break;
        default:
          print("Should not happen");
          break;
      }
      nextIdx += 4;
      nextOpcode = program[nextIdx];
    }
    return program;
  }

  int part2(List<int> program, int result) {
    var tempProgram = List<int>.from(program);
    for(int noun=0; noun<=99; noun+=1){
      for(int verb=0; verb<=99; verb+=1){
        tempProgram = List<int>.from(program);

        tempProgram[1] = noun;
        tempProgram[2] = verb;

        var programResult = part1(tempProgram)[0];

        if(programResult == result){
          return 100 * noun + verb;
        };
      }
    }
    return null;
  }



}