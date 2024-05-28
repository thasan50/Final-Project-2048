private int[][] grid;
private int currCounter;
private int highCounter;
int lastDirection;
private ArrayList<Integer> spaces;
int val = 0;
boolean playing;

void setup() {
  size(800, 800);
}

void draw() {
  background(253, 222, 179);
}

void startgame() {
  if (mouseButton == LEFT && mouseX == 400 && mouseY == 400) {
    playing = true;
    playGame();
  }
}
void playGame() {
  while (playing == true) {
    int nextVal = generateNumber(grid);
    if (spaces.size() > 0) {
      //Idea is to randomly get a value from spaces list, use the coordinates to place
      //Another random value in the grid
    }
  }
}
