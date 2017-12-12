class Char {
  //data
  boolean movingUp, movingDown, movingLeft, movingRight;

  float charX, charY;
  float charSize;
  float charSpeed;

  //constructor
  Char(float cellSize) {
    movingUp = false;
    movingDown = false;
    movingLeft = false;
    movingRight = false;

    charX = 100;
    charY = 100;

    charSize = cellSize;
    charSpeed = 0.95;
  }

  //behaviour
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

    rectMode(CENTER);
    rect(charX, charY, charSize, charSize);
  }

  void collision() {
  }
}