

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
  
  
  //fill(#E3E5D5);
  rect(350, 450, 300, 50, 28);
  
  //fill(#0E742A);
  //textSize(55);
  //text("PLAY", 440, 495);
  

}

void draw() {
  
  
  if (mousePressed) {
    if (mouseX>350 && mouseX < 650 && mouseY>450 && mouseY<500) {
      fill(0);
      rect(500, 500, 0, 0);
    }
  }
}
