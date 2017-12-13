class Enemy {
  //data
  boolean movingUp, movingDown, movingLeft, movingRight;

  float charX, charY;
  float charSize;
  float charSpeed;

  //constructor
  Enemy(DrawLevel currentLevel) {
    movingUp = false;
    movingDown = false;
    movingLeft = true;
    movingRight = false;

    charX = currentLevel.eStartX * currentLevel.cellWidth;
    charY = currentLevel.eStartY * currentLevel.cellHeight;

    charSize = currentLevel.cellWidth;
    charSpeed = 1.3;

    for (int x = 0; x < currentLevel.cols; x++) {
      for (int y = 0; y < currentLevel.rows; y++) {
        if (currentLevel.tiles[x][y] == 's') {
        }
      }
    }
  }  

  //behavior

  void display() {
    stroke(0);
    fill(255, 10, 23);

    rectMode(CORNER);
    rect(charX, charY, charSize, charSize);
  }

  void move(DrawLevel currentLevel) {
    if (movingUp) {
      charY -= charSpeed;
    } else if (movingDown) {
      charY += charSpeed;
    } else if (movingLeft) {
      charX -= charSpeed;
    } else if (movingRight) {
      charX += charSpeed;
    }
    for (int x = 0; x < currentLevel.cols; x++) {
      for (int y = 0; y < currentLevel.rows; y++) {
        if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '<') {
          movingUp = false;
          movingDown = false;
          movingLeft = true;
          movingRight = false;
        }else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '^') {
          movingUp = true;
          movingDown = false;
          movingLeft = false;
          movingRight = false;
        }else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '>') {
          movingUp = false;
          movingDown = false;
          movingLeft = false;
          movingRight = true;
        }else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == 'v') {
          movingUp = false;
          movingDown = true;
          movingLeft = false;
          movingRight = false;
        }
      }
    }
  }
}