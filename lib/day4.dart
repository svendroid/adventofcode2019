class Day4 {
  int part1(List<int> passwords) {
    return passwords
        .where((password) => containsDoubleDigit(password))
        .where((password) => !containsDecreasingDigits(password))
        .toList()
        .length;
  }

  int part2(List<int> passwords) {
    return passwords
        .where((password) => containsDoubleDigitButNotInAGroup(password))
        .where((password) => !containsDecreasingDigits(password))
        .toList()
        .length;
  }

  bool containsDoubleDigit(int password) {
    int prev;
    for (var digit in password.toString().split('').map((c) => int.parse(c))) {
      if (prev != null && prev == digit) {
        return true;
      }
      prev = digit;
    }
    return false;
  }

  bool containsDecreasingDigits(int password) {
    int prev;
    for (var digit in password.toString().split('').map((c) => int.parse(c))) {
      if (prev != null && prev > digit) {
        return true;
      }
      prev = digit;
    }
    return false;
  }

  bool containsDoubleDigitButNotInAGroup(int password) {
    int prev;
    int count = 1;
    for (var digit in password.toString().split('').map((c) => int.parse(c))) {
      if (prev != null) {
        if (prev == digit) {
          count += 1;
        } else {
          if (count == 2) {
            return true;
          } else {
            count = 1;
          }
        }
      }
      prev = digit;
    }
    if (count == 2) {
      return true;
    }
    return false;
  }
}
