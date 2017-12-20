int state;

Char player;
DrawLevel level;
Enemy e1;
Key Key;
Exit exit;

void setup() {
  frameRate(144);
  size(800, 800);
  //fullScreen();

  //initializeValues();

  state = 0;

  level = new DrawLevel();
  player = new Char(level);
  e1 = new Enemy(level);
  Key = new Key(level);
  exit = new Exit(level);
}

void draw() {
  background(255);

  level.display();
  enemy();
  Key.display(player);
  character();
}

void character() {
  player.move(level);
  player.display();
}

void enemy() {
  e1.move(level);
  e1.display();
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