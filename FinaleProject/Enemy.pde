class Enemy {
  //data
  boolean movingUp, movingDown, movingLeft, movingRight;

  float charX, charY;
  float charSize;
  float charSpeed;

  //constructor
  Enemy(float cellSize) {
    movingUp = false;
    movingDown = false;
    movingLeft = false;
    movingRight = false;

    charX = 600;
    charY = 475;

    charSize = cellSize;
    charSpeed = 0.95;
  }  

  //behavior

  void display() {
    stroke(0);
    fill(255, 10, 23);

    rectMode(CENTER);
    rect(charX, charY, charSize, charSize);
  }
}