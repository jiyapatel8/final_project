void setup() {
  size(1000, 700);
  background(#E3E5D5);
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      if ((i+j) % 2 == 0) {
        fill(#0E742A);
        rect(i*40, j*40, 40, 40);
      }
    }
  }
  fill(#BC1B20);
  rect(225, 150, 550, 375);
  textSize(125);
  fill(#E3E5D5);
  stroke(#0E742A);
  text("Jiya's", 350, 275);
  textSize(100);
  text("PIZZERIA", 300, 400);
  
  rect(350, 450, 300, 50, 28);
}
