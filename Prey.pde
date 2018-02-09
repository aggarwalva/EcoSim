public class Prey extends Animal
{ 
  public Prey(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float weight, String path){
    super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type, weight, path);
    this.type = "Prey";
  }
}