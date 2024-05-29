int scoreIncrement() {
  //Should this even exist? Reconsidering
  return 1;
}
void combineValues(int[][] grid, int lastDirection) {
  square(30.0, 30.0, 30.0);
}
int generateNumber() {
  int a = (int)random(2);
  if (a == 0) {
    return 2;
  }
  else {
    return 4;
  }
}
int keyPress() {
  if (key == CODED) {
    if (keyCode == UP) {
      return 1;
    }
    else if (keyCode == RIGHT) {
      return 2;
    }
    else if (keyCode == DOWN) {
      return 3;
    }
    else if (keyCode == LEFT) {
      return 4;
    }
  }
  return 0;
}
//Looking into keyCode right now, for arrow keys
