class Char {
  //data-----------------------------------------------------
  boolean movingUp, movingDown, movingLeft, movingRight;

  float charX, charY;
  float charWidth, charHeight;
  float charSpeed;

  //constructor-----------------------------------------------------
  Char(DrawLevel currentLevel) {
    movingUp = false;
    movingDown = false;
    movingLeft = false;
    movingRight = false;

    charX = currentLevel.startX * currentLevel.cellWidth;
    charY = currentLevel.startY * currentLevel.cellHeight;

    charWidth = currentLevel.cellWidth;
    charHeight = currentLevel.cellHeight;
    
    charSpeed = 0.95;
  }

  //behaviour-----------------------------------------------------
  void move() {
    if (movingUp) {
      if (movingLeft || movingRight) {
        charY -= charSpeed * 0.75; //- charSpeed/4;
      } else {
        charY -= charSpeed;
      }
    } 
    if (movingDown) {
      if (movingLeft || movingRight) {
        charY += charSpeed * 0.75; //- charSpeed/4;
      } else {
        charY += charSpeed;
      }
    } 
    if (movingLeft) {
      if (movingUp || movingDown) {
        charX -= charSpeed * 0.75; //- charSpeed/4;
      } else {
        charX -= charSpeed;
      }
    } 
    if (movingRight) {
      if (movingUp || movingDown) {
        charX += charSpeed * 0.75; //- charSpeed/4;
      } else {
        charX += charSpeed;
      }
    }
    //println(charX);
    //println(charY);
    
    collision();
  }

  void display() {
    stroke(0);
    fill(55, 230, 70);

    rectMode(CORNER);
    rect(charX, charY, charWidth, charHeight);
  }

  void collision() {
  }
}