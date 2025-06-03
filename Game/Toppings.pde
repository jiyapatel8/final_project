class Toppings extends Station{
  void prepare() {
    background(loadImage("wood_counter.jpg"));
    super.prepare();
    
    circle(80, 200, 100);
    circle(180, 275, 100);
    circle(80, 350, 100);
    circle(180, 425, 100);
    circle(80, 500, 100);
    circle(180, 575, 100);
    circle(80, 645, 100);
    
    for (int i=0; i<10; i++) {
    tint(255);
    fill(#DBBB8B); // pineapple
    circle(80, 200, 80);
    image(loadImage("pineapple.png"), 50, 160, 60, 60);
    
    fill(#A26B71); // pepperoni
    circle(180, 275, 80);
    image(loadImage("pepperoni.png"), 150, 240, 60, 60);
    
    fill(#849B82); // basil
    circle(80, 350, 80);
    image(loadImage("basil.png"), 50, 315, 60, 60);
    
    fill(#96829B); // onion
    circle(180, 425, 80);
    image(loadImage("onion.png"), 150, 400, 60, 60);
    
    fill(#5A595A); // olive
    circle(80, 500, 80);
    image(loadImage("olive.png"), 50, 480, 60, 60);
    
    fill(#8D9B82); // green pepper
    circle(180, 575, 80);
    image(loadImage("greenPepper.png"), 150, 550, 60, 60);
    
    fill(#898989); // mushroom
    circle(80, 645, 80);
    image(loadImage("mushroom.png"), 50, 620, 60, 60);
    }
  }
}
