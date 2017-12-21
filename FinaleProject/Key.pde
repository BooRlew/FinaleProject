class Key {
  //data-----------------------------------------------------
  float keyX, keyY;
  float playerX, playerY;
  float keyWidth, keyHeight;

  boolean isPicked;

  //constructor-----------------------------------------------------
  Key(DrawLevel currentLevel) {
    keyWidth = currentLevel.cellWidth;
    keyHeight = currentLevel.cellHeight;

    keyX = currentLevel.keyX * keyWidth;
    keyY = currentLevel.keyY * keyHeight;

    isPicked = false;
  }

  //behaviour-----------------------------------------------------
  void display(Char thePlayer) {
    stroke(0);
    
    detectPick(thePlayer);
    if (!isPicked) {
      rectMode(CORNER);
      fill(200, 200, 0);
    } else {
      fill(0, 0);
    }
    rect(keyX, keyY, keyWidth, keyHeight);
  }

  void detectPick(Char thePlayer) {
    if ((thePlayer.charX > keyX && thePlayer.charX < keyX + keyWidth  &&  thePlayer.charY > keyY && thePlayer.charY < keyY + keyHeight)   |   (thePlayer.charX + keyWidth > keyX && thePlayer.charX + keyWidth < keyX + keyWidth  &&  thePlayer.charY + keyHeight > keyY && thePlayer.charY + keyHeight < keyY + keyHeight)   |   (thePlayer.charX > keyX && thePlayer.charX < keyX + keyWidth  &&  thePlayer.charY + keyHeight > keyY && thePlayer.charY + keyHeight < keyY + keyHeight)   |   (thePlayer.charX + keyWidth > keyX && thePlayer.charX + keyWidth < keyX + keyWidth  &&  thePlayer.charY > keyY && thePlayer.charY < keyY + keyHeight)) {
      isPicked = true;
    }
  }
}