class SprintMeter {
  //data---------------------------------------------------------------
  float rectX, rectY, rectHeight, rectWidth;

  float sprintTime, sprintBar;

  PImage bar;

  //constructor--------------------------------------------------------
  SprintMeter(Char sprintLeft) {
    bar = loadImage("bar.jpg");
    sprintTime = sprintLeft.sprintTime;

    rectHeight = 100;
    rectWidth = 20;

    rectX = 4;
    rectY = height/2 + rectHeight/2;
    //bar = image("bar.jpg", rectX, rectY, rectWidth, rectHeight);
  }

  //behaviour----------------------------------------------------------
  void display(Char sprintLeft) {
    sprintBar = map(sprintLeft.sprintTime, 0, 100, rectHeight, 0); 

    image(bar, rectX, rectY, rectWidth, rectHeight);
    fill(0);
    rect(rectX, rectY, rectWidth, sprintBar);
  }
}