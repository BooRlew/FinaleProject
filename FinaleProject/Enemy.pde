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
    
    charSpeed = 0.2;
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
        if (currentLevel.tiles[floor(charX/currentLevel.cellWidth)][floor(charY/currentLevel.cellHeight)] == '<') {
          movingUp = false;
          movingDown = false;
          movingLeft = true;
          movingRight = false;
        }else if (currentLevel.tiles[floor(charX/currentLevel.cellWidth) + 1][ceil(charY/currentLevel.cellHeight)] == '^') {
          movingUp = true;
          movingDown = false;
          movingLeft = false;
          movingRight = false;
        }else if (currentLevel.tiles[floor(charX/currentLevel.cellWidth) + 1][ceil(charY/currentLevel.cellHeight)] == '>') {
          movingUp = false;
          movingDown = false;
          movingLeft = false;
          movingRight = true;
        }else if (currentLevel.tiles[floor(charX/currentLevel.cellWidth)][ceil((charY/currentLevel.cellHeight))] == 'v') {
          movingUp = false;
          movingDown = true;
          movingLeft = false;
          movingRight = false;
        }
      }
    }
    
    
    fill(0);
    println(floor(charX/currentLevel.cellWidth), floor(charY/currentLevel.cellHeight));
    
    //println(charX);
    //println(charY);
  }
}