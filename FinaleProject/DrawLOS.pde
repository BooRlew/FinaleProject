class DrawLOS {
  //data-----------------------------------------------
  ArrayList<Line> theLines = new ArrayList<Line>();
  //constructor----------------------------------------

  DrawLOS() {
    for (int i=0; i < 20; i++) {
      theLines.add( new Line() );
    }
  }

  //behaviour------------------------------------------
  void display() {
    int total = theLines.size();
    println("The total number of lines is: " + total);
  }
}