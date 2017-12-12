int state;

Char player;
DrawLevel level;
Enemy e1;

void setup() {
  frameRate(144);
  size(800, 800);

  //initializeValues();

  state = 0;

  level = new DrawLevel();
  player = new Char(level.cellWidth);
  e1 = new Enemy(level.cellWidth);
}

void draw() {
  background(255);

  level.display();
  e1.display();
  character();
}

void character() {
  player.move();
  player.display();
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    player.movingUp = true;
  }
  if (key == 's' || key == 'S') {
    player.movingDown = true;
  }
  if (key == 'd' || key == 'D') {
    player.movingRight = true;
  }
  if (key == 'a' || key == 'A') {
    player.movingLeft = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    player.movingUp = false;
  }
  if (key == 's' || key == 'S') {
    player.movingDown = false;
  }
  if (key == 'd' || key == 'D') {
    player.movingRight = false;
  }
  if (key == 'a' || key == 'A') {
    player.movingLeft = false;
  }
}