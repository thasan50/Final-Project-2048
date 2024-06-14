
private int currCounter = 0;
private int highCounter = 0;
int lastDir;
//track of all the numbered blocks, alongside the one that checks for empty spaces
//to create numbers at
boolean playing;
boolean victory;
int size;
Block[][] blocks;
//Let's start with a size at 4x4

void setup() {
  size(800, 850);
  //noLoop();
  background(253, 222, 179); //Background color as classic 2048
  textSize(30);
  currCounter = 0;
  size = 0; //Use to check whether the game is over or not
  victory = false;
  blocks = new Block[4][4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      blocks[i][j] = new Block(0, i, j);
    }
  }
  textAlign(CENTER, CENTER);
}

void draw() {
  background(253, 222, 179);
  fill(253, 222, 179); //Box for the scores
  rect(360, 30, 280, 40);
  rect(360, 70, 280, 40);
  fill(30, 50, 80);
  if (currCounter > highCounter) {
    highCounter = currCounter;
  }
  text("Current Score: "+currCounter, 500, 50); 
  text("High Score: "+highCounter, 500, 90);
  if (playing == false && highCounter != 0) {
    playGame();
  }
  stroke(200, 170, 160);
  if (playing) {
      for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
          if(blocks[i][j].number == 0) {
            fill(255, 255, 255);
          }
          else if(blocks[i][j].number == 2 || blocks[i][j].number == 4) {
            fill(204, 204, 204);
          }
          else if(blocks[i][j].number == 8 || blocks[i][j].number == 16) {
            fill(255, 100, 47);
          }
          else if(blocks[i][j].number == 32 || blocks[i][j].number == 64) {
            fill(238, 0, 0);
            
          }
          else if(blocks[i][j].number == 128 || blocks[i][j].number == 256) {
            fill(205, 150, 205);
          }
          else if (blocks[i][j].number == 512 || blocks[i][j].number == 1024) {
            fill(151, 255, 255);
            
          }
          else if (blocks[i][j].number == 2048) {
            fill(255, 255, 0);
          }
          rect(i*180+30, j*180+140, 180, 180);
          if (blocks[i][j].number != 0) {
            fill(0);
            text(blocks[i][j].number, i*180+120, j*180+220);
          }
        }
      }
      
  }
  if (!playing) { //Creates startbutton
    fill(250, 250, 250);
    rect(350, 350, 100, 100);
    fill(30, 50, 80);
    text("Start", width/2, height/2 - 20);
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
boolean canPlay() { //Did the player use up all the space? Create a losing screen.
//Did the player obtain a value with 2048? Create a winning screen. 
//Else, keep playing and do nothing.
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (blocks[i][j].number == 2048) {
        victory = true;
        playing = false;
        return true;
      }
    }
  }
  if (size == 16) {
    victory = false;
    playing = false;
    return true;
  }
  return false;
}
void startgame() {
  if (mousePressed == true && (mouseX > 350 && mouseX < 450) && (mouseY > 350 && mouseY < 450) && playing == false) {//Need a mousePressed function
    setup();
    playing = true;
    //This thing is activated when we press the start button, causes game to start.
    
  }
}
void playGame() { 
  if (victory == true) {
    //Congratulations, play again? screen
    fill(255,255,0);
    text("Victory! Play again?", width/2, height/2 - 100);
  }
  else {
    //Oops, play again? Screen
    fill(255, 0, 0);
    text("You lost! Play again?", width/2, height/2 - 100);
  }
}

void keyPressed() { //So that took a damn while
if (playing == true) {
  if (keyCode == UP || keyCode == 87) {
    lastDir = 1;
  }
  else if (keyCode == RIGHT || keyCode == 68) {
    lastDir = 2;
  }
  else if (keyCode == DOWN || keyCode == 83 ) {
    lastDir = 3;
  }
  else if (keyCode == LEFT || keyCode == 65) {
    lastDir = 4; 
  }
  switch (lastDir) { //What I see on screen is the transpose of the actual grid, so adjust loops accordingly
    case 1: //UP Case
      for (int i = 0; i < 4; i++) {
        for (int j = 1; j < 4; j++) {
          if (blocks[i][j].number != 0) {
            int a = j;
            while (a > 0) {
              if (blocks[i][a-1].number == 0) {
                blocks[i][a-1].number = blocks[i][a].number;
                blocks[i][a].number = 0;
                a--;
              }
              else if (blocks[i][a-1].number == blocks[i][a].number) {
                blocks[i][a].number = 0;
                blocks[i][a-1].number *= 2;
                size--;
                currCounter += blocks[i][a-1].number;
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
      for (int i = 2; i >= 0; i--) {
        for (int j = 0; j < 4; j++) {
          if (blocks[i][j].number != 0) {
            int a = i;
            while (a < 3) {
              if (blocks[a+1][j].number == 0) {
                blocks[a+1][j].number = blocks[a][j].number;
                blocks[a][j].number = 0;
                a++;
              }
              else if (blocks[a+1][j].number == blocks[a][j].number) {
                blocks[a][j].number = 0;
                blocks[a+1][j].number *= 2;
                size--;
                currCounter += blocks[a+1][j].number;
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
    case 3: //DOWN Case
      for (int i = 0; i < 4; i++) {
        for (int j = 2; j >= 0; j--) {
          if (blocks[i][j].number != 0) {
            int a = j;
            while (a < 3) {
              if (blocks[i][a+1].number == 0) {
                blocks[i][a+1].number = blocks[i][a].number;
                blocks[i][a].number = 0;
                a++;
              }
              else if (blocks[i][a+1].number == blocks[i][a].number) {
                blocks[i][a].number = 0;
                blocks[i][a+1].number *= 2;
                size--;
                currCounter += blocks[i][a+1].number;
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
    case 4: //LEFT Case
      for (int i = 1; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
          if (blocks[i][j].number != 0) {
            int a = i;
            while (a > 0) {
              if (blocks[a-1][j].number == 0) {
                blocks[a-1][j].number = blocks[a][j].number;
                blocks[a][j].number = 0;
                a--;
              }
              else if (blocks[a-1][j].number == blocks[a][j].number) {
                blocks[a][j].number = 0;
                blocks[a-1][j].number *= 2;
                size--;
                currCounter += blocks[a-1][j].number;
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
      
  }
  generateBlock();
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      System.out.print(blocks[i][j].number);
      if (j != 3) {
        System.out.print(", ");
      }
    }
    System.out.println();
  }
  System.out.println();
  if (canPlay()) {
    playGame();
  }
}
}
