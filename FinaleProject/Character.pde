class Char {
  //data-----------------------------------------------------
  boolean movingUp, movingDown, movingLeft, movingRight, isSprint;

  float charX, charY;
  float charWidth, charHeight;
  float charSpeed, tempSpeed;
  
  int sprintTime;

  //constructor-----------------------------------------------------
  Char(DrawLevel currentLevel) {
    movingUp = false;
    movingDown = false;
    movingLeft = false;
    movingRight = false;
    isSprint = false;

    charX = currentLevel.startX * currentLevel.cellWidth;
    charY = currentLevel.startY * currentLevel.cellHeight;

    charWidth = currentLevel.cellWidth;
    charHeight = currentLevel.cellHeight;

    charSpeed = 0.95 * 2;
    tempSpeed = charSpeed;
    
    sprintTime = 100;
  }

  //behaviour-----------------------------------------------------
  void move(DrawLevel currentLevel) {
    if (isSprint && sprintTime >= 0){
      charSpeed *= 2.2;
      
      
      if (millis() % 5 == 0){
        sprintTime --; 
      }
    }
    
    if (movingUp) {
      if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '-'   ||   currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '+'   ||   currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '+') {
        charY += charSpeed;
      } else {

        if (movingLeft || movingRight) {
          charY -= charSpeed * 0.75;
        } else {
          charY -= charSpeed;
        }
      }
    } 
    if (movingDown) {
      if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '-'   ||   currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '+'   ||   currentLevel.tiles[int(charX/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '+') {
        charY -= charSpeed;
      } else {

        if (movingLeft || movingRight) {
          charY += charSpeed * 0.75;
        } else {
          charY += charSpeed;
        }
      }
    } 
    if (movingLeft) {
      if (currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '|'   ||   currentLevel.tiles[int(charX/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '+'   ||   currentLevel.tiles[int(charX/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '+') {
        charX += charSpeed;
      } else {

        if (movingUp || movingDown) {
          charX -= charSpeed * 0.75;
        } else {
          charX -= charSpeed;
        }
      }
    } 
    if (movingRight) {
      if (currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '|'   ||   currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int((charY + currentLevel.cellHeight)/currentLevel.cellHeight)] == '+'   ||   currentLevel.tiles[int((charX + currentLevel.cellWidth)/currentLevel.cellWidth)][int(charY/currentLevel.cellHeight)] == '+') {
        charX -= charSpeed;
      } else {

        if (movingUp || movingDown) {
          charX += charSpeed * 0.75;
        } else {
          charX += charSpeed;
        }
      }
    }

    collision();
    
    charSpeed = tempSpeed;
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