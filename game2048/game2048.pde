import java.util.Arrays;

private int[][] grid;
private int currCounter = 0;
private int highCounter = 0;
int lastDirection;
private ArrayList<ArrayList<Integer>> spaces; //Should I make a new class for cors?
private ArrayList<ArrayList<Integer>> blocks; //I think I might need an arrayList to keep
//track of all the numbered blocks, alongside the one that checks for empty spaces
//to create numbers at
int val = 0;
boolean playing = false;
int size;
//Let's start with a size at 4x4

void setup() {
  size(800, 850);
}

void draw() {
  background(253, 222, 179); //Background color as classic 2048
  textSize(30);
  fill(253, 222, 179); //Box for the scores
  rect(390, 30, 360, 40);
  rect(390, 70, 360, 40);
  fill(30, 50, 80);
  
  text("Current Score", 400, 60); 
  text("High Score", 600, 60);
  stroke(0);
  if (playing) {
      for (int i = 0; i < 4; i++) { //Creates temporary grid
        line(i*200, 900, i*200, 200); //Vertical
        line(0, i*200, width, i*200); //Horizontal
      }
      playGame();
  }
  else if (!playing) { //Creates startbutton
    fill(250, 250, 250);
    rect(350, 350, 100, 100);
    fill(30, 50, 80);
    text("Start", 367, 410);
    startgame();
  }
  
}

void startgame() {
  if (mousePressed == true && (mouseX > 350 && mouseX < 450) && (mouseY > 350 && mouseY < 450)) {//Need a mousePressed function
    playing = true;
    //Give option to set grid size, then use an nxn for loop to set the coordinates for
    //Spaces
    size = 4;
    grid = new int[size][size];
    spaces = new ArrayList<ArrayList<Integer>>();
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        ArrayList<Integer> temp = new ArrayList<Integer>(Arrays.asList(i, j));
        spaces.add(temp);
      }
    }
  }
}
void playGame() {
  int nextVal = generateNumber(); //Maybe we could move these 3 lines to support section
  int b = (int)random(spaces.size());
  grid[spaces.get(b).get(0)][spaces.get(b).get(1)] = nextVal;
  spaces.remove(b);
  currCounter += nextVal;
  text(currCounter, 400, 100);
  if (highCounter < currCounter) {
    highCounter = currCounter;
  }
  text(highCounter, 600, 100);
  System.out.println(Arrays.toString(grid[0]));
  System.out.println(Arrays.toString(grid[1]));
  System.out.println(Arrays.toString(grid[2]));
  System.out.println(Arrays.toString(grid[3]));
  while (playing == true) {
    if (spaces.size() > 0) {
      int k = keyPress();
        if (k == 1) {
          for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[0].length; j++) {
              if (grid[i][j] != 0) {
                  checkFile(k, i, j, grid);
               }
             }
           }
         }
        else if (k == 2) {
          //Shift values right
        }
        else if (k == 3) {
          //Shift values down
        }
        else if (k == 4) {
          //Shift values left
        }
      //Idea is to randomly get a value from spaces list, use the coordinates to place
      //Another random value in the grid
    }
    nextVal = generateNumber();
    b = (int)random(spaces.size());
    grid[spaces.get(b).get(0)][spaces.get(b).get(1)] = nextVal;
    spaces.remove(b);
    currCounter += nextVal;
  }
