class Exit {
  //data
  float exitX, exitY;
  float playerX, playerY;
  float cellWidth, cellHeight;

  boolean isWin;

  //constructor
  Exit(DrawLevel currentLevel) {
    cellWidth = currentLevel.cellWidth;
    cellHeight = currentLevel.cellHeight;
    
    isWin = false;

    exitX = currentLevel.exitX * cellWidth; 
    exitY = currentLevel.exitY * cellHeight;
  }

  //behaviour
  void display(Char thePlayer, Key isPick) {
    stroke(0);
    detectWin(thePlayer, isPick);

    if (!isWin) {
      fill(100, 57, 23);
    } else {
      fill(0, 0); 
    }
    rect(exitX, exitY, cellWidth, cellHeight);
  }
  
  void detectWin(Char thePlayer, Key isPick){
    if (((thePlayer.charX > exitX && thePlayer.charX < exitX + cellWidth  &&  thePlayer.charY > exitY && thePlayer.charY < exitY + cellHeight)   |   (thePlayer.charX + cellWidth > exitX && thePlayer.charX + cellHeight < exitX + cellWidth  &&  thePlayer.charY + cellHeight > exitY && thePlayer.charY + cellHeight < exitY + cellHeight)   |   (thePlayer.charX > exitX && thePlayer.charX < exitX + cellWidth  &&  thePlayer.charY + cellHeight > exitY && thePlayer.charY + cellHeight < exitY + cellHeight)   |   (thePlayer.charX + cellWidth > exitX && thePlayer.charX + cellWidth < exitX + cellWidth  &&  thePlayer.charY > exitY && thePlayer.charY < exitY + cellHeight))   &&   isPick.isPicked == true) {
      isWin = true;
    }}
}