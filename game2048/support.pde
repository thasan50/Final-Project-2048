int generateNumber() {
  int a = (int)random(2);
  if (a == 0) {
    return 2;
  }
  else {
    return 4;
  }
}

int checkFile(int dir, int x, int y, int[][] grid) {//The idea here is that I would check all the further values in the row or column (depends on dir)
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
          x++;
          pos = x;
        }
        else {
          return pos;
        }
      case 3:
      if (!(y < 2)) {
        y--;
        pos = y;
      }
      else {
        return pos; 
      }
      case 4:
      if (!(x < 2)) {
        x--;
        pos = x;
      }
      else {
        return pos;
      }
        
    }
  }
}
//Looking into keyCode right now, for arrow keys
/*
Notepad: 
-Semicolon error


*/
