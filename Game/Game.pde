import java.util.Map;
import garciadelcastillo.dashedlines.*;

int totalTime = 5 * 60 * 1000;
int startTime;
boolean pressed = false;
Station[] allStations = {new Dough(), new SauceCheese(), new Toppings(), new Oven(), new CuttingPacking()};
int currentStation = -1;
Pizza pizza = new Pizza();
ActualPizza pizzaOrder = new ActualPizza();
int orderNumber = 1;
int clickedShape = 0; // 0: nothing, 1: circle, 2: square
boolean sauceClicked = false;
String currTopping;
boolean pressed2 = false;
DashedLines dash;
boolean cut = false, cut2 = false;
int x, y, x2, y2;
boolean both = false;
int minutes;
boolean gameFinished = false;
float ax, ay, bx, by, cx, cy, dx, dy, ex, ey, fx, fy, gx, gy;
ax = 50;
ay = 160;
bx = 150;
by = 240;
cx = 50;
cy = 315;
dx = 150;
dy = 400;
ex = 50;
ey = 480;
fx = 150;
fy = 550;
gx = 50;
gy = 620;

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

  dash = new DashedLines(this);

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
    print(mouseX +" " + mouseY);
    if (mouseX>40 && mouseX<240 && mouseY>100 && mouseY<300) {
      sauceClicked = true;
    }
    if (mouseX>35 && mouseX<210 && mouseY>345 && mouseY<400) {
      pizzaOrder.setCheeseType("mozzarella");
    }
    else if (mouseX>35 && mouseX<210 && mouseY>405 && mouseY<460) {
      pizzaOrder.setCheeseType("provolone");
    }
    else if (mouseX>35 && mouseX<210 && mouseY>465 && mouseY<520) {
      pizzaOrder.setCheeseType("parmesan");
    }
    else if (mouseX>35 && mouseX<210 && mouseY>525 && mouseY<580) {
      pizzaOrder.setCheeseType("ricotta");
    }
    else if (mouseX>35 && mouseX<210 && mouseY>585 && mouseY<640) {
      pizzaOrder.setCheeseType("cheddar");
    }
  }
  
  if (currentStation == 2) {
    if (mouseX>50 && mouseX<110 && mouseY>160 && mouseY<220) {
      currTopping = "pineapple";
    }
    else if (mouseX>150 && mouseX<210 && mouseY>240 && mouseY<300) {
      currTopping = "pepperoni";
    }
    else if (mouseX>50 && mouseX<110 && mouseY>315 && mouseY<375) {
      currTopping = "basil";
    }
    else if (mouseX>150 && mouseX<210 && mouseY>400 && mouseY<460) {
      currTopping = "onion";
    }
    else if (mouseX>50 && mouseX<110 && mouseY>480 && mouseY<540) {
      currTopping = "olive";
    }
    else if (mouseX>150 && mouseX<210 && mouseY>550 && mouseY<610) {
      currTopping = "greenPepper";
    }
    else if (mouseX>50 && mouseX<110 && mouseY>620 && mouseY<680) {
      currTopping = "mushroom";
    }
    pressed2 = true;
  }
  
  if (currentStation == 3) {
    if (mouseX>10 && mouseX<30 && mouseY>10 && mouseY<60) {
      pizzaOrder.setTemperature(-1);
    }
    if (mouseX>130 && mouseX<150 && mouseY>10 && mouseY<60) {
      pizzaOrder.setTemperature(1);
    }
    if (mouseX>180 && mouseX<220 && mouseY>10 && mouseY<60) {
      pizzaOrder.setOvenTime(-1);
    }
    if (mouseX>290 && mouseX<330 && mouseY>10 && mouseY<60) {
      pizzaOrder.setOvenTime(1);
    }
  }
  
  if (currentStation == 4 && !cut) {
    x = mouseX;
    y = mouseY;
    cut = true;
  }
  else if (currentStation == 4 && !cut2) {
    x2 = mouseX;
    y2 = mouseY;
    cut2 = true;
    both = true;
  }
}

void mouseDragged() {
  if (currentStation == 2 && pressed2) {
     if (currTopping.equals("pineapple")) {
       ax = mouseX;
       ay = mouseY;
     }
     if (currTopping.equals("pepperoni")) {
       bx = mouseX;
       by = mouseY;
     }
     if (currTopping.equals("basil")) {
       cx = mouseX;
       cy = mouseY;
     }
     if (currTopping.equals("onion")) {
       dx = mouseX;
       dy = mouseY;
     }
     if (currTopping.equals("olive")) {
       ex = mouseX;
       ey = mouseY;
     }
     if (currTopping.equals("green pepper")) {
       fx = mouseX;
       fy = mouseY;
     }
     if (currTopping.equals("mushroom")) {
       gx = mouseX;
       gy = mouseY;
     }
  }
}


void mouseReleased() {
  if (currentStation == 2) {

  }
}

void draw() {
  if (pressed) {

    if ((pizzaOrder.getDoughShape().equals("circular") && clickedShape != 1 && currentStation==0) || (pizzaOrder.getDoughShape().equals("circular") && currentStation != 0)) {
      allStations[currentStation].prepare();
      fill(#E3E5D5);
      noStroke();
      circle(500, 400, 500);
      clickedShape = 1;
    }
    else if ((pizzaOrder.getDoughShape().equals("sicilian") && clickedShape != 2 && currentStation==0) || (pizzaOrder.getDoughShape().equals("sicilian") && currentStation != 0)) {
      allStations[currentStation].prepare();
      fill(#E3E5D5);
      noStroke();
      square(250, 150, 500);
      clickedShape = 2;
    }

    if (currentStation >= 1 && sauceClicked) {
      if (sauceClicked) {
        tint(255, 255);
        image(loadImage("sauceOnPizza.png"), 280, 180, 450, 450);
      }
      if (pizzaOrder.getCheeseType().equals("cheddar")) {
        image(loadImage("cheddarOnPizza.png"), 260, 170, 475, 475);
      }
      else if (!pizzaOrder.getCheeseType().equals("default")) {
        tint(255); // FIX THIS TINT
        image(loadImage("cheddarOnPizza.png"), 260, 170, 475, 475);
      }
    }
    
    if (currentStation == 2) {
      tint(255);
      fill(#DBBB8B); // pineapple
      circle(80, 200, 80);
      image(loadImage("pineapple.png"), ax, ay, 60, 60);
      
      fill(#A26B71); // pepperoni
      circle(180, 275, 80);
      image(loadImage("pepperoni.png"), bx, by, 60, 60);
      
      fill(#849B82); // basil
      circle(80, 350, 80);
      image(loadImage("basil.png"), cx, cy, 60, 60);
      
      fill(#96829B); // onion
      circle(180, 425, 80);
      image(loadImage("onion.png"), dx, dy, 60, 60);
    
      fill(#5A595A); // olive
      circle(80, 500, 80);
      image(loadImage("olive.png"), ex, ey, 60, 60);
    
      fill(#8D9B82); // green pepper
      circle(180, 575, 80);
      image(loadImage("greenPepper.png"), fx, fy, 60, 60);
    
      fill(#898989); // mushroom
      circle(80, 645, 80);
      image(loadImage("mushroom.png"), gx, gy, 60, 60);
    }
  
    if (currentStation == 3) {
      strokeWeight(2);
      stroke(0);
      fill(#6F6F6F);
      rect(10, 10, 150, 50, 28);
      textSize(40);
      fill(0);
      text("-   " + pizzaOrder.getTemperature() + "   +", 15, 50);
      
      strokeWeight(2);
      stroke(0);
      fill(#6F6F6F);
      rect(180, 10, 150, 50, 28);
      textSize(40);
      fill(0);
      text("-   " + pizzaOrder.getOvenTime() + "   +", 205, 50);
    }
    
    int timeLeft = 0;
    int seconds = 0;
    if (!gameFinished) {
    timeLeft = totalTime - (millis() - startTime);
    seconds = (timeLeft / 1000) % 60;
    minutes = (timeLeft / (1000 * 60)) % 60;
    }
    strokeWeight(2);
    stroke(0);
    fill(255);
    rect(width/2 - 100, 25, 200, 50, 28);
    textSize(40);
    fill(0);
    text(nf(minutes, 2) + ":" + nf(seconds, 2), width/2 - 45, 63);
    
    if (currentStation == 4) {
      dash.pattern(20, 10);
      if (!cut && !cut2) {
        dash.line(500, 150, mouseX, mouseY);
      }
      if (cut) {
        dash.line(500, 150, x, y);
      }
      if (cut && !cut2) {
        dash.line(260, 390, mouseX, mouseY);
      }
      if (cut2) {
        dash.line(260, 390, x2, y2);
      }
      if (both) {
        text("Finished!", 25, 100);
        text("Your total score is: " + getScorePercentage(), 25, 130);
        gameFinished = true;
        dash.line(500, 150, x, y);
        dash.line(260, 390, x2, y2);
      }
    }
  }
}

double getScorePercentage() { //dough shape, has sauce?, correct cheese, correct toppings, correct toppings amount, temp, time, extra time left
  double totalScore = 10 + pizza.getToppings().size();
  double actualScore = 0;
  int totalToppingsAmount1;
  /*
  for (Integer each : pizza.getToppings().values()) {
    totalScore += each;
    totalToppingsAmount1 += each;
  }
  */
  actualScore = totalScore;
  if (!(pizzaOrder.getDoughShape().equals(pizza.getDoughShape()))) {
    actualScore -= 1;
  }
  if (!sauceClicked) {
    actualScore -= 1;
  }
  if (pizza.getCheeseType() != pizzaOrder.getCheeseType()) {
    actualScore -= 1;
  }
  if (pizza.getOvenTime() != pizzaOrder.getOvenTime()) {
    actualScore -= 1;
  }
  if (pizza.getTemperature() != pizzaOrder.getTemperature()) {
    actualScore -= 1;
  }
  if (minutes > 3) {
    actualScore -= 1;
  }
  /*
  int totalToppingAmt;
  for (Integer each : pizzaOrder.getToppings().values()) {
    totalToppingAmt += each;
  }
  if (pizza.getToppings().size() != pizzaOrder.getToppings().size()) {
    actualScore -= abs(pizzaOrder.getToppings().size() - pizza.getToppings().size());
  }
  */
  return round((float) actualScore/ (float) totalScore) * 100;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT && currentStation < 4 && currentStation != -1) {
      currentStation = (currentStation + 1) % 5;
      allStations[currentStation].prepare();
    }
    if (keyCode == LEFT && currentStation > 0) {
      currentStation = (currentStation - 1) % 5;
      allStations[currentStation].prepare();
    }
    if (currentStation == 3) {
      if (key == '+') {
        pizzaOrder.setTemperature(1);
      }
      if (key == '-') {
        pizzaOrder.setTemperature(-1);
      }
    }
  }
}
