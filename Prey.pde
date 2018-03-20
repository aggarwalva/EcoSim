public class Prey extends Animal
{ 
  private long timer;
  private float reproduce;
  private boolean shouldReproduce = false;
  public Prey(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float weight, String path, float reproduce){
    super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type, weight, path);
    this.type = "Prey";
    timer = millis();
    this.reproduce = reproduce;
  }
  
  public boolean shouldReproduce(){
   return shouldReproduce; 
  }
  
  public void reproduce(){
   shouldReproduce = false; 
  }
  
  public float getReproduceTime(){
   return reproduce; 
  }
  
  public void display(){
   super.display();
   if(millis() - timer > reproduce){
      shouldReproduce = true;
      timer = millis();
    }
   textSize(30);
   text((int)reproduce, getX(), getY()+10);
  }
  
}