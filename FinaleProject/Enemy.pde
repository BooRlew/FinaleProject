class Enemy {
  //data-----------------------------------------------------
  boolean movingUp, movingDown, movingLeft, movingRight;

  float charX, charY;
  float charWidth, charHeight;
  float charSpeed;

  //constructor-----------------------------------------------------
  Enemy(DrawLevel currentLevel) {
    movingUp = false;
    movingDown = false;
    movingLeft = true;
    movingRight = false;

    charX = currentLevel.eStartX * currentLevel.cellWidth;
    charY = currentLevel.eStartY * currentLevel.cellHeight;

    charWidth = currentLevel.cellWidth;
    charHeight = currentLevel.cellHeight;

    charSpeed = 1.7;
  }  

  //behavior-----------------------------------------------------

  void display() {

    stroke(0);
    fill(255, 10, 23);

    rectMode(CORNER);
    rect(charX, charY, charWidth, charHeight);
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

        //turn left
        if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '<') {
          movingUp = false;
          movingDown = false;
          movingLeft = true;
          movingRight = false;

          //turn up
        } else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '^') {
          movingUp = true;
          movingDown = false;
          movingLeft = false;
          movingRight = false;

          //turn right
        } else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '>') {
          movingUp = false;
          movingDown = false;
          movingLeft = false;
          movingRight = true;

          //turn down (for what)
        } else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int((charY/currentLevel.cellHeight))] == 'v') {
          movingUp = false;
          movingDown = true;
          movingLeft = false;
          movingRight = false;
        }
      }
    }
  }
}