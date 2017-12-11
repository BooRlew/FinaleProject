float charX, charY;
float cellWidth, cellHeight;


int[][] grid;
int cols, rows;
int state;

boolean movingUp, movingDown, movingLeft, movingRight;



void setup() {
  size(800, 800);
  background(255);

  state = 0;

  movingUp = false;
  movingDown = false;
  movingLeft = false;
  movingRight = false;

  initializeValues();
}

void draw() {
  fill(0, 0, 0, 0);

  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      rect(x, y, x*cellWidth, y*cellHeight);
    }
  }
}

void initializeValues() {
  cellWidth = 20;
  cellHeight = 20;
  
  cols = int(width/cellWidth);
  rows = int(height/cellHeight);
}