float charX, charY;
float cellWidth, cellHeight;
float gridDimension;


int[][] grid;
int cols, rows;
int state;

Char player;

void setup() {
  frameRate(144);
  size(800, 800);

  initializeValues();
  
  state = 0;


  player = new Char(cellWidth);
}

void draw() {
  background(255);

  fill(0, 0);
  stroke(0, 10);


  rectMode(CORNER);
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      rect(x*cellWidth, y*cellWidth, cellWidth, cellHeight);
    }
  }

  character();
}

void initializeValues() {
  gridDimension = 30;

  cellWidth = width/gridDimension;
  cellHeight = height/gridDimension;
  
  println(cellWidth);

  cols = int(width/cellWidth);
  rows = int(height/cellHeight);
}

void character() {
  player.move();
  player.display();
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    player.movingUp = true;
  }
  if (key == 's' || key == 'S') {
    player.movingDown = true;
  }
  if (key == 'd' || key == 'D') {
    player.movingRight = true;
  }
  if (key == 'a' || key == 'A') {
    player.movingLeft = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    player.movingUp = false;
  }
  if (key == 's' || key == 'S') {
    player.movingDown = false;
  }
  if (key == 'd' || key == 'D') {
    player.movingRight = false;
  }
  if (key == 'a' || key == 'A') {
    player.movingLeft = false;
  }
}