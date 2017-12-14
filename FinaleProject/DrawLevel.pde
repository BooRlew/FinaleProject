class DrawLevel {
  //data-----------------------------------------------------
  int[][] grid;
  int cols, rows;

  float cellWidth, cellHeight;
  float gridDimension;
  float startX, startY;
  float eStartX, eStartY;
  float keyX, keyY;

  String levelToLoad;

  char tileType;
  char[][] tiles;

  //constructor-----------------------------------------------------
  DrawLevel() {

    gridDimension = 29;

    cellWidth = width/gridDimension;
    cellHeight = height/gridDimension;

    cols = int(width/cellWidth);
    rows = int(height/cellHeight);

    tiles = new char[cols][rows];

    loadLevel();

    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        if (tiles[x][y] == 'S') {
          startX = x;
          startY = y;
        }
        if (tiles[x][y] == '<'){
          eStartX = x;
          eStartY = y;
          
        } 
        if ( tiles[x][y] == 'K') {
          keyX = x;
          keyY = y;
        }
      }
    }
  }

  //behaviour-----------------------------------------------------
  void display() {
    fill(0, 0);
    noStroke();

    //loadLevel();

    rectMode(CORNER);
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        noStroke();
        if (tiles[x][y] == '|') {
          fill(0);
        } else if ( tiles[x][y] == '-') {
          fill(80);
        } else if ( tiles[x][y] == '=') {
          fill(120);
        } else if ( tiles[x][y] == '+') {
          fill(50);
        } else if ( tiles[x][y] == 'S') {
          fill(200);
        } else if ( tiles[x][y] == 'F') {
          fill(100);
        } //else if ( tiles[x][y] == 'K') {
          //stroke(0);
          //fill(200, 200, 0);
        //} 
        else {
          fill(255, 0);
        }
        rect(x*cellWidth, y*cellHeight, cellWidth + 1, cellHeight + 1);
      }
    }
  }

  void loadLevel() {
    levelToLoad = "Level/lvl-2.txt";

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