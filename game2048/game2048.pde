private int[][] grid;
private int currCounter = 0;
private int highCounter = 0;
int lastDirection;
private ArrayList<ArrayList<Integer>> spaces; //Should I make a new class for cors?
int val = 0;
boolean playing = false;
int size;
//Let's start with a size at 4x4

void setup() {
  size(800, 800);
}

void draw() {
  background(253, 222, 179); //Background color as classic 2048
  textSize(30);
  fill(253, 222, 179); //Box for the scores
  rect(390, 30, 360, 50);
  fill(30, 50, 80);
  text("Current Score", 400, 60); 
  text("High Score", 600, 60);
  stroke(0);
  for (int i = 0; i < 10; i++) { //Creates temporary grid
    line(i*100, 0, i*100, height);
    line(0, i*100, width, i*100);
  }
  if (!playing) { //Creates startbutton
    fill(250, 250, 250);
    rect(350, 350, 100, 100);
    fill(30, 50, 80);
    text("Start", 367, 410);
    startgame();
  }
  
}

void startgame() {
  if (mouseButton == LEFT && (mouseX > 350 && mouseX < 450) && (mouseY > 350 && mouseY < 450)) {
    playing = true;
    //Give option to set grid size, then use an nxn for loop to set the coordinates for
    //Spaces
    size = 4;
    spaces = new ArrayList<ArrayList<Integer>>();
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        spaces.add(i, j);
      }
    }
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
