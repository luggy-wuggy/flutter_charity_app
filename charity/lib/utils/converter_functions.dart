String convertToLetterGrade(double value) {
  if (value >= 98.0) {
    return "A+";
  } else if (value >= 92 && value < 98.0) {
    return "A";
  } else if (value >= 89.5 && value < 92) {
    return "A-";
  } else if (value >= 88 && value < 89.5) {
    return "B+";
  } else if (value >= 82 && value < 88.0) {
    return "B";
  } else if (value > 79.5 && value < 82) {
    return "B-";
  } else if (value >= 78 && value < 79.5) {
    return "C+";
  } else if (value >= 72 && value < 78) {
    return "C";
  } else if (value > 69.5 && value < 72) {
    return "C-";
  } else if (value >= 60 && value < 69.5) {
    return "D";
  } else {
    return "F";
  }
}
