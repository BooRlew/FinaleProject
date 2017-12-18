class Enemy {
  //data-----------------------------------------------------
  boolean movingUp, movingDown, movingLeft, movingRight;

  float charX, charY;
  float charWidth, charHeight;
  float charSpeed;
  int waitTime, timeTurned;

  //constructor-----------------------------------------------------
  Enemy(DrawLevel currentLevel) {
    movingUp = false;
    movingDown = false;
    movingLeft = true;
    movingRight = false;

    charX = currentLevel.eStartX * currentLevel.cellWidth;
    charY = currentLevel.eStartY * currentLevel.cellHeight;

    //println(currentLevel.cellWidth);

    waitTime = 1127;
    timeTurned= 9999;

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
        if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '<') {
          movingUp = false;
          movingDown = false;
          movingLeft = true;
          movingRight = false;

          //println(int(charX/currentLevel.cellWidth), int(charY/currentLevel.cellHeight));
        } else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '^') {
          //timeTurned = millis();

          //if (millis() >= timeTurned + waitTime) {
            
            movingUp = true;
            movingDown = false;
            movingLeft = false;
            movingRight = false;
          //}

          //println(int(charX/currentLevel.cellWidth), int(charY/currentLevel.cellHeight));
        } else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '>') {
          movingUp = false;
          movingDown = false;
          movingLeft = false;
          movingRight = true;

          //println(int(charX/currentLevel.cellWidth), int(charY/currentLevel.cellHeight));
        } else if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int((charY/currentLevel.cellHeight))] == 'v') {
          movingUp = false;
          movingDown = true;
          movingLeft = false;
          movingRight = false;

          //println(int(charX/currentLevel.cellWidth), int(charY/currentLevel.cellHeight));
        }
        //if (millis() >= timeTurned + waitTime) {

        //  movingUp = true;
        //  movingDown = false;
        //  movingLeft = false;
        //  movingRight = false;
        //}
      }
    }




    //fill(0);
    //println(floor(charX/currentLevel.cellWidth), ceil(charY/currentLevel.cellHeight));

    //println(charX);
    //println(charY);
  }
}