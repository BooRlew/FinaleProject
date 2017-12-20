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
  void move(DrawLevel currentLevel) {
    if (movingUp) {
      if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '-'   |   currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '+'   |   currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '+') {
      } else {

        if (movingLeft || movingRight) {
          charY -= charSpeed * 0.75;
        } else {
          charY -= charSpeed;
        }
      }
    } 
    if (movingDown) {
      if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '-'   |   currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '+'   |   currentLevel.tiles[int(charX/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '+') {
      } else {

        if (movingLeft || movingRight) {
          charY += charSpeed * 0.75;
        } else {
          charY += charSpeed;
        }
      }
    } 
    if (movingLeft) {
      if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '|'   |   currentLevel.tiles[int(charX/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '+'   |   currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '+') {
      } else {

        if (movingUp || movingDown) {
          charX -= charSpeed * 0.75;
        } else {
          charX -= charSpeed;
        }
      }
    } 
    if (movingRight) {
      if (currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '|'   |   currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '+'   |   currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '+') {
      } else {

        if (movingUp || movingDown) {
          charX += charSpeed * 0.75;
        } else {
          charX += charSpeed;
        }
      }
    }

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