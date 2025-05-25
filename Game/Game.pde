int totalTime = 20 * 60 * 1000;
int startTime;
boolean pressed = false;
Station[] allStations = {new Dough(), new SauceCheese(), new Oven(), new Toppings(), new CuttingPacking()};
int currentStation = -1;

void setup() {
  size(1000, 700);
  background(#E3E5D5); // beige
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      if ((i+j) % 2 == 0) {
        fill(#0E742A); // dark green
        rect(i*40, j*40, 40, 40);
      }
    }
  }
  fill(#BC1B20); // dark red
  rect(225, 150, 550, 375);
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
  if (mouseX>350 && mouseX < 650 && mouseY>450 && mouseY<500) {
      print("I clicked");
      pressed = true;
      startTime = millis();
      currentStation = 0;
    }
}

void draw() {
  /*int s = second(); 
  int m = minute(); 
  int h = hour();
  fill(255);
  rect(width/2, 50, 200, 50, 28);
  textSize(50);
  fill(0);
  text(h + ":" + m + ":" + s, width/2, 80);*/
  
  if (pressed) {
    int timeLeft = totalTime - (millis() - startTime);
    int seconds = (timeLeft / 1000) % 60;
    int minutes = (timeLeft / (1000 * 60)) % 60;
    fill(255);
    rect(width/2 - 100, 50, 200, 50, 28);
    textSize(40);
    fill(0);
    textAlign(CENTER, CENTER);
    text(nf(minutes, 2) + ":" + nf(seconds, 2), width/2, 75);
  }
  
  //allStations[currentStation].prepare();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      currentStation = (currentStation + 1) % 5;
    }
    if (keyCode == LEFT) {
      currentStation = (currentStation - 4) % 5;
    }
  }
}
