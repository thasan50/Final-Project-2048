private int[][] grid;
private int currCounter = 0;
private int highCounter = 0;
int lastDirection;
private ArrayList<ArrayList<Integer>> spaces; //Should I make a new class for cors?
int val = 0;
boolean playing = false;

void setup() {
  size(800, 800);
}

void draw() {
  background(253, 222, 179);
  textSize(30);
  fill(253, 222, 179);
  rect(390, 30, 360, 50);
  fill(30, 50, 80);
  text("Current Score", 400, 60);
  text("High Score", 600, 60);
  
}

void startgame() {
  if (mouseButton == LEFT && mouseX == 400 && mouseY == 400) {
    playing = true;
    playGame();
  }
}
void playGame() {
  int nextVal = generateNumber(); //Maybe we could move these 3 lines to support section
  int b = (int)random(spaces.size());
  grid[spaces.get(b).get(0)][spaces.get(b).get(1)] = nextVal;
  currCounter += nextVal;
  while (playing == true) {
    if (spaces.size() > 0) {
      if (keyPress() == 1) {
        //Shift values up
      }
      else if (keyPress() == 2) {
        //Shift values right
      }
      else if (keyPress() == 3) {
        //Shift values down
      }
      else if (keyPress() == 4) {
        //Shift values left
      }
      //Idea is to randomly get a value from spaces list, use the coordinates to place
      //Another random value in the grid
    }
    nextVal = generateNumber();
    b = (int)random(spaces.size());
    grid[spaces.get(b).get(0)][spaces.get(b).get(1)] = nextVal;
    currCounter += nextVal;
  }
  
   
}
