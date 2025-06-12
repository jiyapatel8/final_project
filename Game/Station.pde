class Station {
  
  void prepare() {
    strokeWeight(10);
    stroke(#E3E5D5);
    fill(#E3E5D5);
    rect(800, 200, 225, 400);
    noStroke();
    for (int i=0; i<8; i+=2) {
       fill(#F7CFD7);
       rect(800, 248 + i*44, 225, 44);
    }
    fill(#717171); // gray
    text("#1", 810, 240);
    textSize(20);
    text("Shape: " + pizza.getDoughShape(), 810, 286);
    text("Cheese: " + pizza.getCheeseType(), 810, 330);
    text("Oven: " + pizza.getOvenTime() + " minutes at " + pizza.getTemperature() + "°", 810, 374);
    int i = 0;
    for (String topping: pizza.getToppings().keySet()) {
      text(pizza.getToppings().get(topping) + " X " + topping, 810, 380 + ((i+1)*44) - 6);
      i++;
    }
  }
  
}
