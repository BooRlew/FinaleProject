class Char {
  //data-----------------------------------------------------
  boolean movingUp, movingDown, movingLeft, movingRight;

  float charX, charY;
  float charSize;
  float charSpeed;

  //constructor-----------------------------------------------------
  Char(DrawLevel currentLevel) {
    movingUp = false;
    movingDown = false;
    movingLeft = false;
    movingRight = false;

    charX = currentLevel.startX * currentLevel.cellWidth;
    charY = currentLevel.startY * currentLevel.cellHeight;

    charSize = currentLevel.cellWidth;
    charSpeed = 0.95;
  }

  //behaviour-----------------------------------------------------
  void move() {
    if (movingUp) {
      charY -= charSpeed;
    } 
    if (movingDown) {
      charY += charSpeed;
    } 
    if (movingLeft) {
      charX -= charSpeed;
    } 
    if (movingRight) {
      charX += charSpeed;
    }
    collision();
  }

  void display() {
    stroke(0);
    fill(55, 230, 70);

    rectMode(CORNER);
    rect(charX, charY, charSize, charSize);
  }

  void collision() {
  }
}