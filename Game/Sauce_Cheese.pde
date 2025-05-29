class SauceCheese extends Station{
  void prepare() {
    background(loadImage("wood_counter.jpg"));
    super.prepare();
    tint(255, 255);
    image(loadImage("sauce.png"), 25, 100, 200, 200);
    fill(#A5A5A5);
    rect(25, 325, 200, 350);
    strokeWeight(5);
    stroke(#646464);
    fill(#FFF8E5); // mozzarella & provolone & parmesan & ricotta
    rect(35, 345, 175, 55); //mozz
    rect(35, 405, 175, 55); // prov
    rect(35, 465, 175, 55); // parmesan
    rect(35, 525, 175, 55); //ricotta
    fill(#FFC636); // cheddar
    rect(35, 585, 175, 55); // cheddar
    tint(255, 100);
    image(loadImage("cheeseBar.jpg"), 35, 345, 175, 295);
    fill(#646464);
    text("mozzarella", 50, 375);
    text("provolone", 50, 435);
    text("parmesan", 50, 495);
    text("ricotta", 50, 555);
    text("cheddar", 50, 615);
  }
}
