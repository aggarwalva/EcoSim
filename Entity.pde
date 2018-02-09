/*
Entity class defines the top level object in EcoSim.

Any attributes or functionality that can be used by
children classes should be implemented here.

*/
public class Entity
{

  //INSTANCE VARIABLES
  //x and y coordinates
  private float x;
  private float y;

  //size parameters
  private float entityWidth;
  private float entityHeight;

  //color and opacity
  private color entityColor;
  private float opacity;

  //Entity name and type
  private String name;
  private String type;
  
  //CONSTRUCTOR
  public Entity(float x, float y, float entityWidth, float entityHeight, color entityColor, float opacity, String name, String type)
  {
    this.x = x;
    this.y = y;

    this.entityWidth=entityWidth;
    this.entityHeight = entityHeight;

    this.entityColor = entityColor;
    this.opacity = opacity;

    this.name = name;
    this.type = type; 
    
  }
  
  
  
  //ACCESSOR METHODS
  public float getX() 
  {
    return x;
  }
  public float getY() 
  {
    return y;
  }

  public float getWidth() 
  {
    return entityWidth;
  }
  public float getHeight() 
  {
    return entityHeight;
  }

  public color getColor() 
  {
    return entityColor;
  }
  public float getOpacity() 
  {
    return opacity;
  }

  public String getName() 
  {
    return name;
  }
  
  public String getType()
  {
    return type;
  }

  //SETTER METHODS
  public void setX(float x) 
  {
    this.x = x;
  }
  public void setY(float y) 
  {
    this.y = y;
  }
  
  public void setWidth(float entityWidth) 
  {
    this.entityWidth = entityWidth;
  }
  public void setHeight(float entityHeight) 
  {
    this.entityHeight = entityHeight;
  }
  
  public void setColor(color entityColor)
  {
    this.entityColor = entityColor;
  }
  public void setName(String name)
  {
    this.name=name;
  }
  public void setType(String type)
  {
    this.type=type;
  }

  //toString
  public String toString()
  {
    
    return name + " is a " + type;
  }
  
  //Basic display
  //Should probably be overriden in children classes
  //to give a unique look to each subclass
  public void display()
  {
    fill(entityColor, opacity);
    ellipse(x, y, entityWidth, entityHeight);
    textAlign(CENTER);
    textSize(10);
    fill(0);
    text(name, x, y-5);
    text(type, x, y+10);
  }
}