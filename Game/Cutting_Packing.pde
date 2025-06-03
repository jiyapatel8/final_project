class CuttingPacking extends Station{
  
  void prepare() {
    background(loadImage("wood_counter.jpg"));
    super.prepare();
    image(loadImage("box.png"), 100, 0, 800, 700);
    
    dash.pattern(20, 10);
    
    
  }
}
