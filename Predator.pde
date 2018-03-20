public class Predator extends Animal
{
  private float xMotion, yMotion, speed, sight;
  private int amtEaten = 0;
  private boolean shouldReproduce = false, hasReproduced = false;
  private long reproduceCooldown, gestationTimer, starveTimer;
  
  public Predator(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float weight, String path, float speed, float sight){
    super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type, weight, path);
    this.type = "Predator";
    this.speed = speed;
    this.sight = sight;
    reproduceCooldown = millis();
    gestationTimer = millis();
    starveTimer = millis();
  }
  
  public void reproduced(boolean b){
     hasReproduced = b;
  }
  
  public boolean hasReproduced(){
     return hasReproduced;
  }
  
  public void reproduce(){
    shouldReproduce = false;
    amtEaten = 0;
    reproduced(true);
    reproduceCooldown = millis();
    starveTimer = millis();
  }
  
  public boolean shouldReproduce(){
    return (shouldReproduce && (millis() - reproduceCooldown > 2000));
  }
  
  public float getSpeed(){
   return speed; 
  }
  
  public float getSight(){
   return sight; 
  }
  
  public long getStarve(){
   return millis() - starveTimer;
  }
  
  public void move()
  {
    xMotion = random(-speed,speed);
    yMotion = random(-speed,speed);
    
    this.setX(this.getX() + xMotion);
    this.setY(this.getY() + yMotion);
    
    if(width - this.getX() < 30){
      this.setX(this.getX() - 5);
    }
    if(this.getX() < 30){
      this.setX(this.getX() + 5);
    }
    if(height - this.getY() < 30){
      this.setY(this.getY() - 5);
    }
    if(this.getY() < 30){
      this.setY(this.getY() + 5);
    }
    
    for(Animal a : collidableObjects){
      if(dist(a.getX(), a.getY(), this.getX(), this.getY()) < a.getDiagonal() + this.getDiagonal() && !a.equals(this)){
        if(a.getType() == "Prey"){
          a.kill(); 
          if(millis() - gestationTimer > 2000){
           amtEaten++; 
          }
          
          if(amtEaten > 1){
            shouldReproduce = true; 
          }
        } else {
          this.setX(this.getX() - (xMotion * 2));
          this.setY(this.getY() - (yMotion * 2));  
        }
      } else if(hasLOS(a.getX(), a.getY(), sight)){
         if(a.getType() == "Prey"){
             xMotion = abs(xMotion) * Utils.getSign(a.getX() - this.getX()) * speed * 0.1;
             yMotion = abs(yMotion) * Utils.getSign(a.getY() - this.getY()) * speed * 0.1;
             
             this.setX(this.getX() + xMotion);
             this.setY(this.getY() + yMotion);
         }
      }
    }
  }
  
  public void display(){
   super.display();
   textSize(30);
   text(speed, getX(), getY()+10);
  }
}