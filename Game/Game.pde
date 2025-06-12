import java.util.Map;
import garciadelcastillo.dashedlines.*;

Station[] allStations = {new Dough(), new SauceCheese(), new Toppings(), new Oven(), new CuttingPacking()};
int currentStation = -1;
Pizza pizza = new Pizza();
ActualPizza pizzaOrder = new ActualPizza();
String currTopping;
int clickedShape = 0; // 0: nothing, 1: circle, 2: square
boolean sauceClicked = false;
boolean pressed2 = false;
DashedLines dash;
boolean cut = false, cut2 = false;
int x, y, x2, y2;
boolean both = false;
int minutes;
boolean ovenStarted = false;
int totalTime = 2 * 60 * 1000;
int startTime;
boolean pressed = false;
boolean gameFinished = false;
boolean finishedButton = false;
boolean showInstructions = false;

ArrayList<PVector> pineapples = new ArrayList<PVector>();
ArrayList<PVector> pepperonis = new ArrayList<PVector>();
ArrayList<PVector> basils = new ArrayList<PVector>();
ArrayList<PVector> onions = new ArrayList<PVector>();
ArrayList<PVector> olives = new ArrayList<PVector>();
ArrayList<PVector> greenPeppers = new ArrayList<PVector>();
ArrayList<PVector> mushrooms = new ArrayList<PVector>();

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
  
  fill(#E3E5D5);
  stroke(#BC1B20);
  strokeWeight(3);
  circle(1000, 650, 70);
  fill(#0E742A);
  text("?", 990, 670);
}

void mousePressed() {
  if (currentStation ==-1 && mouseX>975 && mouseX<1050 && mouseY>625 && mouseY<750) {
    showInstructions = true;
  }
  if (currentStation ==-1 && mouseX>740 && mouseX<760 && mouseY>150 && mouseY<175) {
    showInstructions = false;
  }
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
      }
  }
  if (currentStation==1) {
    if (mouseX>40 && mouseX<240 && mouseY>100 && mouseY<300) {
      sauceClicked = true;
    }
    if (mouseX>35 && mouseX<210 && mouseY>345 && mouseY<400 && sauceClicked) {
      pizzaOrder.setCheeseType("mozzarella");
    }
    else if (mouseX>35 && mouseX<210 && mouseY>405 && mouseY<460 && sauceClicked) {
      pizzaOrder.setCheeseType("provolone");
    }
    else if (mouseX>35 && mouseX<210 && mouseY>465 && mouseY<520 && sauceClicked) {
      pizzaOrder.setCheeseType("parmesan");
    }
    else if (mouseX>35 && mouseX<210 && mouseY>525 && mouseY<580 && sauceClicked) {
      pizzaOrder.setCheeseType("ricotta");
    }
    else if (mouseX>35 && mouseX<210 && mouseY>585 && mouseY<640 && sauceClicked) {
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
      currTopping = "green pepper";
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
    if (mouseX>100 && mouseX<250 && mouseY>70 && mouseY<120) {
      ovenStarted = true;
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
  if (currentStation == 4 && both && mouseX>25 && mouseX<325 && mouseY>100 && mouseY<150) {
    finishedButton = true;
  }
}

void mouseReleased() {
  if (currentStation == 2 && currTopping != null && mouseX>280 && mouseX<730 && mouseY>180 && mouseY<630) {
    PVector finalPlace = new PVector(mouseX, mouseY);
    if (currTopping.equals("pineapple")) {
      pineapples.add(finalPlace);
      pizzaOrder.addTopping("pineapple");
    } 
    else if (currTopping.equals("pepperoni")) {
      pepperonis.add(finalPlace);
      pizzaOrder.addTopping("pepperoni");
    } 
    else if (currTopping.equals("basil")) {
      basils.add(finalPlace);
      pizzaOrder.addTopping("basil");
    } 
    else if (currTopping.equals("onion")) {
      onions.add(finalPlace);
      pizzaOrder.addTopping("onion");
    } 
    else if (currTopping.equals("olive")) {
      olives.add(finalPlace);
      pizzaOrder.addTopping("olive");
    } 
    else if (currTopping.equals("green pepper")) {
      greenPeppers.add(finalPlace);
      pizzaOrder.addTopping("green pepper");
    } 
    else if (currTopping.equals("mushroom")) {
      mushrooms.add(finalPlace);
      pizzaOrder.addTopping("mushroom");
    }
    pressed2 = false;
    currTopping = null;
  }
}

void draw() {
  if (!pressed && showInstructions) {
    fill(#E3E5D5);
    rect(225, 150, 550, 375, 28);
    fill(0);
    textSize(20);
    text("X", 750, 175);
    text("Instructions: ", 230, 175);
    text("1. Select pizza shape: circular or sicilian (square)", 230, 200);
    text("2. Put sauce and correct cheese", 230, 225);
    text("3. Add correct toppings and amount by pressing, dragging, and ", 230, 250);
    text("releasing mouse", 250, 275);
    text("4. Adjust oven temperature/time by clicking the + and - and start", 230, 300);
    text("5. Cut pizza by clicking on the other end of the pizza", 230, 325);
    text("6. When finished before time runs out, click the button FINISHED ", 230, 350);
    text("to get score", 250, 375);
    text("Other: ", 230, 425);
    text(" - pizza will turn darker after starting oven but very dark if burnt", 230, 450);
    text(" - toppings cannot/will not be placed outside the area the pizza is", 230, 475);
  }
  if (!pressed && !showInstructions) {
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
  
  fill(#E3E5D5);
  stroke(#BC1B20);
  strokeWeight(3);
  circle(1000, 650, 70);
  fill(#0E742A);
  text("?", 990, 670);
  }
  if (pressed) {

    if ((pizzaOrder.getDoughShape().equals("circular") && clickedShape != 1 && currentStation==0) || (pizzaOrder.getDoughShape().equals("circular") && currentStation != 0)) {
      allStations[currentStation].prepare();
      if (ovenStarted && (pizzaOrder.getTemperature() > pizza.getTemperature() || pizzaOrder.getOvenTime() > pizza.getOvenTime()))  {
        fill(#B48583);
      }
      else if (ovenStarted)  {
        fill(#E5CFBE);
      }
      else {
        fill(#E3E5D5);
      }
      noStroke();
      circle(500, 400, 500);
      clickedShape = 1;
    }
    else if ((pizzaOrder.getDoughShape().equals("sicilian") && clickedShape != 2 && currentStation==0) || (pizzaOrder.getDoughShape().equals("sicilian") && currentStation != 0)) {
      allStations[currentStation].prepare();
      if (ovenStarted && (pizzaOrder.getTemperature() > pizza.getTemperature() || pizzaOrder.getOvenTime() > pizza.getOvenTime()))  {
        fill(#B48583);
      }
      else if (ovenStarted) {
        fill(#E5CFBE);
      }
      else {
        fill(#E3E5D5);
      }
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
        image(loadImage("cheeseOnPizza.png"), 260, 170, 475, 475);
      }
    }
    
    if (currentStation >= 2) {
      for (PVector each: pineapples) {
        image(loadImage("pineapple.png"), each.x, each.y, 60, 60);
      }
      for (PVector each: pepperonis) {
        image(loadImage("pepperoni.png"), each.x, each.y, 60, 60);
      }
      for (PVector each: basils) {
        image(loadImage("basil.png"), each.x, each.y, 60, 60);
      }
      for(PVector each: onions) {
        image(loadImage("onion.png"), each.x, each.y, 60, 60);
      }
      for (PVector each: olives) {
        image(loadImage("olive.png"), each.x, each.y, 60, 60);
      }
      for (PVector each: greenPeppers) {
        image(loadImage("greenPepper.png"), each.x, each.y, 60, 60);
      }
      for (PVector each: mushrooms) {
        image(loadImage("mushroom.png"), each.x, each.y, 60, 60);
      }
      
      if (currTopping != null && pressed2) {
        if (currTopping.equals("pineapple")) {
          image(loadImage("pineapple.png"), mouseX, mouseY, 60, 60);
        } 
        else if (currTopping.equals("pepperoni")) {
          image(loadImage("pepperoni.png"), mouseX, mouseY, 60, 60);
        } 
        else if (currTopping.equals("basil")) {
          image(loadImage("basil.png"), mouseX, mouseY, 60, 60);
        } 
        else if (currTopping.equals("onion")) {
          image(loadImage("onion.png"), mouseX, mouseY, 60, 60);
        } 
        else if (currTopping.equals("olive")) {
          image(loadImage("olive.png"), mouseX, mouseY, 60, 60);
        } 
        else if (currTopping.equals("green pepper")) {
          image(loadImage("greenPepper.png"), mouseX, mouseY, 60, 60);
        } 
        else if (currTopping.equals("mushroom")) {
          image(loadImage("mushroom.png"), mouseX, mouseY, 60, 60);
        }
      }
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
      
      strokeWeight(2);
      stroke(0);
      fill(#6F6F6F);
      rect(100, 70, 150, 50, 28);
      textSize(25);
      fill(0);
      text("START OVEN", 110, 105);
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
    if (minutes <= 0 && seconds <= 0) {
      gameFinished = true;
      text("Finished!", 25, 100);
      text("Your total score is: " + getScorePercentage(), 25, 140);
    }
    
    if (currentStation == 4 && clickedShape > 0) {
      dash.pattern(20, 10);
      if (!cut && !cut2) {
        dash.line(500, 150, mouseX, mouseY);
      }
      if (cut) {
        fill(0);
        dash.line(500, 150, x, y);
      }
      if (cut && !cut2) {
        fill(0);
        dash.line(260, 390, mouseX, mouseY);
      }
      if (cut2) {
        fill(0);
        dash.line(260, 390, x2, y2);
      }
      if (both) {
        if (!finishedButton) {
          fill(#E3E5D5);
          stroke(#0E742A);
          rect(25, 100, 300, 50, 28);
          fill(#0E742A);
          textSize(55);
          text("FINISHED?", 45, 143);
        }
        if (finishedButton) {
          fill(#0E742A);
          text("Finished!", 25, 100);
          text("Your total score is: " + getScorePercentage(), 25, 130);
          gameFinished = true;
        }
        fill(0);
        dash.line(500, 150, x, y);
        dash.line(260, 390, x2, y2);
      }
    } 
  }
}

String getScorePercentage() { //dough shape, has sauce?, correct cheese, correct toppings, correct toppings amount, temp, time, extra time left
  double totalScore = 6 + (2 * pizza.getToppings().size());
  double actualScore = 0;
  int totalToppingsAmount1 = 0;
  for (Integer eachVal : pizza.getToppings().values()) { 
    totalScore += eachVal;
    totalToppingsAmount1 += eachVal;
  }
  actualScore = totalScore;
  if (!(pizzaOrder.getDoughShape().equals(pizza.getDoughShape()))) { //dough shape
    actualScore -= 1;
  }
  if (!sauceClicked) { // has sauce?
    actualScore -= 1;
  }
  if (pizza.getCheeseType() != pizzaOrder.getCheeseType()) { // correct cheese
    actualScore -= 1;
  }
  if (pizza.getOvenTime() != pizzaOrder.getOvenTime()) { // time
    actualScore -= 1;
  }
  if (pizza.getTemperature() != pizzaOrder.getTemperature()) { // temp
    actualScore -= 1;
  }
  if (!finishedButton) { // extra time?
    actualScore -= 1;
  }
  
  int totalToppingAmt = 0;
  for (Integer eachVal : pizzaOrder.getToppings().values()) { // correct total toppings amount
    totalToppingAmt += eachVal;
  }
  if (totalToppingAmt != totalToppingsAmount1) {
    actualScore -= abs(totalToppingAmt - totalToppingsAmount1);
  }
  if (pizza.getToppings().size() != pizzaOrder.getToppings().size()) { // number of topping type
    actualScore -= abs(pizzaOrder.getToppings().size() - pizza.getToppings().size());
  }
  for (String eachKey : pizza.getToppings().keySet()) { 
    if (!(pizzaOrder.getToppings().containsKey(eachKey))) { // correct toppings type
      actualScore -= 1;
    }
    else if (pizza.getToppings().get(eachKey) != pizzaOrder.getToppings().get(eachKey)) { // correct toppings amount for each type
      actualScore -= abs(pizza.getToppings().get(eachKey) - pizzaOrder.getToppings().get(eachKey));
    }
  }
  
  return (int) round(((float) actualScore/ (float) totalScore) * 100) + "%";
}

void keyPressed() {
  if (key == CODED && !gameFinished) {
    if (keyCode == RIGHT && currentStation < 4 && currentStation != -1) {
      currentStation = (currentStation + 1) % 5;
      allStations[currentStation].prepare();
      currTopping = null;
    }
    if (keyCode == LEFT && currentStation > 0) {
      currentStation = (currentStation - 1) % 5;
      allStations[currentStation].prepare();
      currTopping = null;
    }
  }
}
