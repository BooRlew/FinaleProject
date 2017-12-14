class Key {
  //data-----------------------------------------------------
  float keyX, keyY;
  float playerX, playerY;
  float keyWidth, keyHeight;

  boolean isPicked;

  //constructor-----------------------------------------------------
  Key(DrawLevel currentLevel, Char thePlayer) {
    keyX = currentLevel.keyX * currentLevel.cellWidth;
    keyY = currentLevel.keyY * currentLevel.cellHeight;

    playerX = thePlayer.charX;
    playerY = thePlayer.charY;

    keyWidth = currentLevel.cellWidth;
    keyHeight = currentLevel.cellHeight;

    isPicked = false;
  }

  //behaviour-----------------------------------------------------
  void display() {
    detectPick();

    if (!isPicked) {
      rectMode(CORNER);
      fill(200, 200, 0);
    } else {
      fill(0, 0);
    }
    rect(keyX, keyY, keyWidth, keyHeight);
    
    //println(isPicked);
  }

  void detectPick() {
    if (playerX > keyX && playerX < keyX + keyWidth  &&  playerY > keyY && playerY < keyY + keyHeight) {
      isPicked = true;
    }
  }
}