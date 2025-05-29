import java.util.Arrays;
import java.util.ArrayList;

class Pizza {
  private String doughShape;
  private String cheeseType;
  private int cheeseAmount; // light,medium,extra as well as # of ounces on order instructions
  private int temperature; // in degrees Fareneheit
  private int ovenTime; // in minutes
  private Topping[] toppings; // pineapple, pepperoni, basil leaves, onions, olives, green peppers, mushrooms
  private ArrayList<String> toppingArr = new ArrayList<>(Arrays.asList("pineapple", "pepperoni", "basil", "onion", "olive", "green pepper", "mushroom"));
  
  public Pizza(String doughShape, String cheeseType, int cheeseAmount, int temperature, int ovenTime, Topping[] toppings) {
    this.doughShape = doughShape;
    this.cheeseType = cheeseType;
    this.cheeseAmount = cheeseAmount;
    this.temperature = temperature;
    this.ovenTime = ovenTime;
    this.toppings = toppings;
  }
  
  public Pizza() {
    int rand = (int) random(2);
    if (rand == 0) {
      doughShape = "sicilian";
    }
    else {
      doughShape = "circular";
    }
    
    rand = (int) random(5);
    if (rand == 0) {
      cheeseType = "mozzarella";
    }
    else if (rand == 1) {
      cheeseType = "cheddar";
    }
    else if (rand == 2) {
      cheeseType = "provolone";
    }
    else if (rand == 3) {
      cheeseType = "parmesan";
    }
    else if (rand == 4) {
      cheeseType = "ricotta";
    }
    
    rand = (int) random(10) + 1;
    cheeseAmount = rand;
    
    rand = (int) random(150) + 401;
    temperature = rand;
    
    rand = (int) random(15) + 11;
    ovenTime = rand;
    
    rand = (int) random(4) + 1;
    toppings = new Topping[rand];
    for (int i=0; i<toppings.length; i++) {
      toppings[i] = new Topping(toppingArr.remove((int) random(toppingArr.size())), (int) random(10)+1);
    }
  }
  
  public String getDoughShape() {
    return doughShape;
  }
  
  public String getCheeseType() {
    return cheeseType;
  }
  
  public int getCheeseAmount() {
    return cheeseAmount;
  }
  
  public int getTemperature() {
    return temperature;
  }
  
  public int getOvenTime() {
    return ovenTime;
  }
  
  public Topping[] getToppings() {
    return toppings;
  }
  
  public void addTopping(String topping) {
  }
  
  public void setOvenTime(int time) {
  }
  
  public void setTemperature(int temp) {
  }
  
  public void addCheeseAmount(int amt) {
  }
  
  public void setCheeseType(String type) {
  }
  
  public void setDoughShape(String shape) {
    doughShape = shape;
  }
}
