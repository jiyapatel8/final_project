class Topping {
  private String topping;
  private int toppingAmt; // singular pieces of each topping
  
  public Topping(String topping, int toppingAmt) {
    this.topping = topping;
    this.toppingAmt = toppingAmt;
  }
  
  public String getTopping() {
    return topping;
  }
  
  public int getToppingAmt() {
    return toppingAmt;
  }
  
}
