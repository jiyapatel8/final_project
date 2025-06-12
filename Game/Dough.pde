class Dough extends Station{
  public Dough() {
    
  }
  
  void prepare() {
    stroke(0);
    background(loadImage("wood_counter.jpg"));
    super.prepare();
    
    fill(#E3E5D5);
    circle(100, 250, 155);
    square(25, 450, 150);
  }
  
}
