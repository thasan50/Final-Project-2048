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
-What do all of my functions do?
-Setup - creates screen
-Draw should create a constantly updating grid of four by four squares along with 
updating the score counter. Base state should have a start button and the grid is still
oresent with the last game. Clicking start button should refresh the screen and place
a random pair of numbers on the board.
-Startgame should be the supplementary function for draw, because it's used to check
if the start button is pressed. If pressed, playing becomes true, an empty grid is
created, and playgame is activated. The empty list of spaces coordinates is also filled out
-Keypress detects whether a key is pressed and returns a corresponding output. If the wrong
key is pressed, keypress shouldn't do anything.
-Generatenumber should return a random 2 or 4 block every time the key is pressed
-Checkfile check the spaces in the same file as each block. If it's possible to move
in the corresponding direction, it should check the following spaces until it encounters
a failure. If the block fails, it should move the value to the last position saved. 
Saved positions should start at the original position. 
-Playgame is the biggest function




*/
