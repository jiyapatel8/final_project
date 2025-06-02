class Oven extends Station{
  void prepare() {
    background(loadImage("fire.jpg"));
    image(loadImage("oven.png"), 50, 50, 50, 50);
    super.prepare();
  }
}
