int state;

Char player;
DrawLevel level;
Enemy enemy;
Key Key;
Exit exit;
SprintMeter sprint;
DrawLOS LoS;

void setup() {
  frameRate(144);
  size(800, 800);

  state = 0;

  level = new DrawLevel();
  player = new Char(level);
  enemy = new Enemy(level);
  Key = new Key(level);
  exit = new Exit(level);
  sprint = new SprintMeter(player);
  LoS = new DrawLOS();
}

void draw() {
  background(255);

  finish();
  level.display();
  Key.display(player);
  enemy();
  character();
}

void finish() {
  exit.display(player, Key);
}

void character() {
  player.move(level);
  player.display();

  sprint.display(player);
}

void enemy() {
  LoS.direction(enemy);
  LoS.display(enemy);

  enemy.move(level);
  enemy.display();
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
  if (key == CODED) {
    if (keyCode == SHIFT) {
      player.isSprint = true;
    }
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
  if (key == CODED) {
    if (keyCode == SHIFT) {
      player.isSprint = false;
    }
  }
}