//Edit this so that all unnecessary functions are removed and so graphics are instated.
/*
So with setup I want to create my score box, my background color, everything
besides the grid. Now with draw, I want to create different colored squares
based on the numbers. If I click new game, I want to reset all the values
besides highCounter. That might involve calling setup
*/
private int currCounter = 0;
private int highCounter = 0;
int lastDir;
//track of all the numbered blocks, alongside the one that checks for empty spaces
//to create numbers at
boolean playing;
int size;
Block[][] blocks;
//Let's start with a size at 4x4

void setup() {
  size(800, 850);
  background(253, 222, 179); //Background color as classic 2048
  textSize(30);
  size = 0; //Use to check whether the game is over or not
}

void draw() {
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
void generateBlock() { //Ought to be completed
  int r = ((int)random(2)+1)*2;
  while (size != 16) {
    int x = (int)random(4);
    int y = (int)random(4);
    if(blocks[x][y].number == 0) {
      blocks[x][y].number = r;
      size++;
      draw();
      break;
    }
  }
  //Generating a random number in the grid, places it in an empty space in the grid. Randomly chosen space. 
}
boolean canPlay() { //Did the player use up all the space? Is it not possible to combine any further? Create a losing screen.
//Did the player obtain a value with 2048? Create a winning screen. 
//Else, keep playing and do nothing.
for (int i = 0; i < 4; i++) {
  for (int j = 0; j < 4; j++) {
    if (blocks[i][j].number == 2048) {
      //YOU WIN! RETURN TRUE!
    }
  }
}
  if (size == 16) {
    //I might just end the game here, YOU LOSE!
  }
  
  
}
void startgame() {
  if (mousePressed == true && (mouseX > 350 && mouseX < 450) && (mouseY > 350 && mouseY < 450)) {//Need a mousePressed function
    playing = true;
    //This thing is activated when we press the start button, causes game to start.
    
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
}

void keyPressed() { //So that took a damn while
  if (keyCode == UP) {
    lastDir = 1;
  }
  else if (keyCode == RIGHT) {
    lastDir = 2;
  }
  else if (keyCode == DOWN) {
    lastDir = 3;
  }
  else if (keyCode == LEFT) {
    lastDir = 4; 
  }
  switch (lastDir) {
    case 1: //UP Case
      for (int i = 1; i < 4; i++) {
        int a = i;
        for (int j = 0; j < 4; j++) {
          if (blocks[i][j].number != 0) {
            while (a > 0) {
              if (blocks[a-1][j].number == 0) {
                blocks[a-1][j].number = blocks[a][j].number;
                blocks[a][j].number = 0;
                draw();
                a--;
              }
              else if (blocks[a][j].number == blocks[a-1][j].number) {
                blocks[a-1][j].number *= 2;
                blocks[a][j].number = 0;
                size--;
                draw();
                break;
              }
              else {
                break;
              }
            }
          }
        }
      }
      break;
    case 2: //RIGHT Case
      for (int i = 0; i < 4; i++) {
        for (int j = 2; j >= 0; j--) {
          int b = j;
          if (blocks[i][j].number != 0) {
            while (b < 3) {
              if (blocks[i][b+1].number == 0) {
                blocks[i][b+1].number = blocks[i][b].number;
                blocks[i][b].number = 0;
                draw();
                b++;
              }
              else if (blocks[i][b].number == blocks[i][b+1].number) {
                blocks[i][b+1].number *= 2;
                blocks[i][b].number = 0;
                size--;
                draw();
                break;
              }
              else {
                break;
              }
              
            }
          }
        }
      }
    case 3: //DOWN Case
      for (int i = 2; i >= 0; i--) {
        int c = i;
        for (int j = 0; j < 4; j++) {
          if (blocks[i][j].number != 0) {
            while (c < 3) {
              if (blocks[c+1][j].number == 0) {
                blocks[c+1][j].number = blocks[c][j].number;
                blocks[c][j].number = 0;
                draw();
                c++;
              }
              else if (blocks[c][j].number == blocks[c+1][j].number) {
                blocks[c+1][j].number *= 2;
                blocks[c][j].number = 0;
                size--;
                draw();
                break;
              }
              else {
                break;
              }
            }
          }
        }
      }
    case 4: //LEFT Case
      for (int i = 0; i < 4; i++) {
        for (int j = 1; j < 4; j++) {
          int d = j;
          if (blocks[i][j].number == 0) {
            while (d > 0) {
              if (blocks[i][d-1].number == 0) {
                blocks[i][d-1].number = blocks[i][d].number;
                blocks[i][d].number = 0;
                draw();
                d--;
              }
              else if (blocks[i][d-1].number == blocks[i][d].number) {
                blocks[i][d-1].number *= 2;
                blocks[i][d].number = 0;
                size--;
                draw();
                break;
              }
              else {
                break;
              }
            }
          }
        }
      }
      
  }
  generateBlock();
  draw();
  if (!canPlay()) {
    
  }
  
}
