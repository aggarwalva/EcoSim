public class Animal extends Entity
{
  //INSTANCE VARIABLES
  private float weight, xMotion, yMotion;
  private PImage img;
  protected ArrayList<Animal> collidableObjects;
  public boolean isAlive;
  public String type;
  
  //CONSTRUCTOR
  public Animal(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type, float weight, String path)
  {
    super(x, y, entityWidth, entityHeight, entityColor, opacity, name, type);
    this.weight = weight;
    this.type = type;
    img = loadImage(path);
    isAlive = true;
    
    collidableObjects = new ArrayList<Animal>();
  }
  
  //ACCESSOR METHODS
  public float getWeight()
  {
    return weight;
  }
  
  public double getDiagonal(){
    return Math.sqrt((Math.pow(this.getWidth()/2,2)) + (Math.pow(this.getHeight()/2,2))); 
  }
  
  public String getType(){
   return type; 
  }
  
  public boolean isAlive(){
    return isAlive; 
  }

  public boolean shouldReproduce(){
     return false; 
  }
  //SETTER METHODS
  public void setWeight(int weight)
  {
    this.weight=weight;
  }
  
  public float getSpeed(){
    return 0;
  }
  
  public void addCollidables(ArrayList<Animal> a){
      this.collidableObjects = a;
  }
  
  //FUNCTIONAL METHODS
  public void move()
  {
    xMotion = random(-5,5);
    yMotion = random(-5,5);
    
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
        this.setX(this.getX() - (xMotion * 2));
        this.setY(this.getY() - (yMotion * 2));
      }
    }
    
  }
  
  public void eat(float amount)
  {
    weight += amount;
  }
  
  public void kill(){
    this.isAlive = false; 
  }
  
  public void reproduce(){
    
  }
  
  public boolean hasLOS(float x, float y, float dist)
  {
    if(dist(this.getX(),this.getY(), x,y) < dist) return true;
    return false;
  }
  
  public void resize(float w, float h){
    img.resize(int(img.width * w), int(img.height * h));
    this.setWidth(img.width/2);
    this.setHeight(img.height/2);
  }
  
  public void display(){
    image(img, this.getX(),this.getY());
    textAlign(CENTER);
    textSize(50);
    fill(0);
    text("REEEEEE", getX() + 50, getY()-5);
    //text(type, x, y+10);
  }
}