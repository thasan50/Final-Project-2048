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
int keyPress() { //Is this working? I need to create a grid first
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
int checkFile(int dir, int x, int y, arrayList<arrayList<Integer>> grid) {//The idea here is that I would check all the further values in the row or column (depends on dir)
  //Store the position each time before checking. If the value can move, then it does, otherwise it doesn't.
  int pos = 0;
  while (true) {
    switch (dir) {
      case 1:
        if (!(y > grid[0].length - 2)) {
          y++;
          pos = y;
        }
        else {
          return pos;
        }
      case 2:
        if (!(x > grid.length - 2)) {
          
        }
        else {
          return pos;
        }
      case 3:
      if (!(y < 2)) {
      
      }
      case 4:
      if (!(x < 2)) {
        
      }
        
    }
  }
}
//Looking into keyCode right now, for arrow keys
