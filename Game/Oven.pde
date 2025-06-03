class Oven extends Station{
  void prepare() {
    background(loadImage("fire.jpg"));
    image(loadImage("oven.jpg"), 0, 0, 850, 700);
    super.prepare();
  }
}
