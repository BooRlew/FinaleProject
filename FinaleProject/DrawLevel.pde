class DrawLevel {
  //data-----------------------------------------------------
  int[][] grid;
  int cols, rows;
  float gridDimension;

  float[] topLeftX;
  float[] topRightX;
  float[] botLeftX;
  float[] botRightX;
  
  float[] topLeftY;
  float[] topRightY;
  float[] botLeftY;
  float[] botRightY;

  float cellWidth, cellHeight;
  float startX, startY;
  float eStartX, eStartY;
  float keyX, keyY;
  float exitX, exitY;

  String levelToLoad;

  char tileType;
  char[][] tiles;
  
  PImage blank, corner, horizontal, vertical;

  //constructor-----------------------------------------------------
  DrawLevel() {
    blank = loadImage("Art/Walls/Blank.png");
    corner = loadImage("Art/Walls/Corner.png");
    horizontal = loadImage("Art/Walls/Horizontal.png");
    vertical = loadImage("Art/Walls/Vertical.png");

    gridDimension = 29;

    cellWidth = width/gridDimension;
    cellHeight = height/gridDimension;

    println(cellWidth);

    cols = int(width/cellWidth);
    rows = int(height/cellHeight);

    tiles = new char[cols][rows];
    
    int temp = int(gridDimension);

    topLeftX = new float[temp];
    topRightX = new float[temp];
    botLeftX = new float[temp];
    botRightX = new float[temp];
    
    topLeftY = new float[temp];
    topRightY = new float[temp];
    botLeftY = new float[temp];
    botRightY = new float[temp];

    loadLevel();

    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        if (tiles[x][y] == 'S') {
          startX = x;
          startY = y;
        }
        if (tiles[x][y] == '<') {
          eStartX = x;
          eStartY = y;
        } 
        if (tiles[x][y] == 'K') {
          keyX = x;
          keyY = y;
        }
        if (tiles[x][y] == 'F') {
          exitX = x;
          exitY = y;
        }
      }
    }
  }

  //behaviour-----------------------------------------------------
  void display() {
    fill(0, 0);
    noStroke();

    rectMode(CORNER);
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        noStroke();
        if (tiles[x][y] == '|') {
          fill(0, 0);
          image(vertical,x * cellWidth, y*cellHeight, cellWidth + 1, cellHeight + 1 );
          
          
          topLeftX[x] = x * cellWidth;
          topRightX[x] = x * cellWidth;
          botLeftX[x] = x * cellWidth;
          botRightX[x] = x * cellWidth;
          
          topLeftY[y] = y * cellWidth;
          topRightY[y] = y * cellWidth;
          botLeftY[y] = y * cellWidth;
          botRightY[y] = y * cellWidth;
          
        } else if ( tiles[x][y] == '-') {
          fill(0, 0);
          image(horizontal,x * cellWidth, y*cellHeight, cellWidth + 1, cellHeight + 1 );
          
          topLeftX[x] = x * cellWidth;
          topRightX[x] = x * cellWidth;
          botLeftX[x] = x * cellWidth;
          botRightX[x] = x * cellWidth;
          
          topLeftY[y] = y * cellWidth;
          topRightY[y] = y * cellWidth;
          botLeftY[y] = y * cellWidth;
          botRightY[y] = y * cellWidth;
        } else if ( tiles[x][y] == '=') {
          fill(0, 0);
          image(blank,x * cellWidth, y*cellHeight, cellWidth + 1, cellHeight + 1 );
          
          topLeftX[x] = x * cellWidth;
          topRightX[x] = x * cellWidth;
          botLeftX[x] = x * cellWidth;
          botRightX[x] = x * cellWidth;
          
          topLeftY[y] = y * cellWidth;
          topRightY[y] = y * cellWidth;
          botLeftY[y] = y * cellWidth;
          botRightY[y] = y * cellWidth;
        } else if ( tiles[x][y] == '+') {
          fill(0, 0);
          image(corner,x * cellWidth, y*cellHeight, cellWidth + 1, cellHeight + 1 );
          
          topLeftX[x] = x * cellWidth;
          topRightX[x] = x * cellWidth;
          botLeftX[x] = x * cellWidth;
          botRightX[x] = x * cellWidth;
          
          topLeftY[y] = y * cellWidth;
          topRightY[y] = y * cellWidth;
          botLeftY[y] = y * cellWidth;
          botRightY[y] = y * cellWidth;
        } else if ( tiles[x][y] == 'S') {
          fill(0 ,0);
          
        } else {
          fill(170);
        }
        rect(x*cellWidth, y*cellHeight, cellWidth + 1, cellHeight + 1);
      }
    }
  }

  void loadLevel() {
    levelToLoad = "Level/lvl-1.txt";

    String lines[] = loadStrings(levelToLoad);
    for (int y=0; y < gridDimension; y++) {
      for (int x=0; x < gridDimension; x++) {

        //Designates each cell as a block
        tileType = lines[y].charAt(x);
        tiles[x][y] = tileType;
      }
    }
  }
}