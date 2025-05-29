int totalTime = 20 * 60 * 1000;
int startTime;
boolean pressed = false;
Station[] allStations = {new Dough(), new SauceCheese(), new Oven(), new Toppings(), new CuttingPacking()};
int currentStation = -1;
Pizza pizza = new Pizza();
ActualPizza pizzaOrder = new ActualPizza();
int orderNumber = 1;
int clickedShape = 0; // 0: nothing, 1: circle, 2: square
boolean sauceClicked = false;

void setup() {
  size(1050, 700);
  background(#E3E5D5); // beige
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      if ((i+j) % 2 == 0) {
        fill(#0E742A); // dark green
        rect(i*50, j*50, 50, 50);
      }
    }
  }

  fill(#BC1B20); // dark red
  rect(225, 150, 550, 375);
  shapeMode(CENTER);

  textSize(125);
  fill(#E3E5D5); // beige
  stroke(#0E742A); // dark green
  text("Jiya's", 350, 275);

  textSize(100);
  text("PIZZERIA", 300, 400);

  fill(#E3E5D5);
  rect(350, 450, 300, 50, 28);

  fill(#0E742A);
  textSize(55);
  text("PLAY", 440, 495);

}

void mousePressed() {
  if (currentStation ==-1 && mouseX>350 && mouseX < 650 && mouseY>450 && mouseY<500) {
      pressed = true;
      startTime = millis();
      currentStation = 0;
      allStations[currentStation].prepare();
  }
  if (currentStation==0) {
      if (mouseX>78 && mouseX<255 && mouseY>172 && mouseY<327) {
        pizzaOrder.setDoughShape("circular");
      }
      else if (mouseX>25 && mouseX<175 && mouseY>450 && mouseY<600) {
        pizzaOrder.setDoughShape("sicilian");
        print("i clicked");
      }
  }
  if (currentStation==1) {
    if (mouseX>40 && mouseX<240 && mouseY>100 && mouseY<300) {
      sauceClicked = true;
    }
  }
}


void draw() {
  if (pressed) {
    int timeLeft = totalTime - (millis() - startTime);
    int seconds = (timeLeft / 1000) % 60;
    int minutes = (timeLeft / (1000 * 60)) % 60;
    strokeWeight(2);
    stroke(0);
    fill(255);
    rect(width/2 - 100, 25, 200, 50, 28);
    textSize(40);
    fill(0);
    text(nf(minutes, 2) + ":" + nf(seconds, 2), width/2 - 45, 63);

    if ((pizzaOrder.getDoughShape().equals("circular") && clickedShape != 1 && currentStation==0) || (pizzaOrder.getDoughShape().equals("circular") && currentStation != 0)) {
      allStations[currentStation].prepare();
      fill(#E3E5D5);
      circle(500, 400, 500);
      clickedShape = 1;
    }
    else if ((pizzaOrder.getDoughShape().equals("sicilian") && clickedShape != 2 && currentStation==0) || (pizzaOrder.getDoughShape().equals("sicilian") && currentStation != 0)) {
      allStations[currentStation].prepare();
      fill(#E3E5D5);
      square(250, 150, 500);
      clickedShape = 2;
    }

    if (currentStation == 1 && sauceClicked) {
      image(loadImage("sauceOnPizza.png"), 280, 180, 450, 450);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT && currentStation < 4) {
      currentStation = (currentStation + 1) % 5;
      allStations[currentStation].prepare();
      print(currentStation);
    }
    if (keyCode == LEFT && currentStation > 0) {
      currentStation = (currentStation - 1) % 5;
      allStations[currentStation].prepare();
    }
  }
}
