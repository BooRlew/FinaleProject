//LOSdirection
//0 = up
//1 = down
//2 = left
//3 = right


class DrawLOS {
  //data-----------------------------------------------
  ArrayList<Line> theLines = new ArrayList<Line>();

  int LOSdirection;
  
  //boolean isCaught = false;
  //constructor----------------------------------------

  DrawLOS() {
    for (int i=0; i < 100; i++) {
      theLines.add( new Line() );
    }
    LOSdirection = 2;
  }

  //behaviour------------------------------------------
  void display(Enemy theEnemy) {
    int total = theLines.size();
    //println("The total number of lines is: " + total + "| The direction is " + LOSdirection);

    pushMatrix();
    translate(theEnemy.charX + theEnemy.charWidth/2, theEnemy.charY + theEnemy.charHeight/2);
    if (LOSdirection == 0) {
      rotate(radians(90));
    } else if (LOSdirection == 1) {
      rotate(radians(-90));
    } else if (LOSdirection == 3) {
      rotate(radians(180));
    } 

    for (float j = 0; j < total - 1; j++) {
      pushMatrix();

      rotate (radians(j/2 + 110));

      if (j == 0 || j == total - 2){
      stroke(0);
      } else {
        stroke(255, 0, 0, 100);
      }
      line(0, 0, 250, 250);
      
      stroke(0);
      
      popMatrix();
    }
    popMatrix();
  }

  void direction(Enemy theEnemy) {
    if (theEnemy.movingUp) {
      LOSdirection = 0;
    } else if (theEnemy.movingDown) {
      LOSdirection = 1;
    } else if (theEnemy.movingLeft) {
      LOSdirection = 2;
    } else if (theEnemy.movingRight) {
      LOSdirection = 3;
    }
  }
  
   void detectCatch(Char thePlayer) {
   }
}