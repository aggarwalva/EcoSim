/*public Entity ent;
public Animal fu, cyrus, seba;
public Animal[] ecosystem;

public void setup()
{
  String path;
  size(960, 540);
  //Create a basic entity at a random location on the canvas
  ent = new Entity(random(width), random(height), 50, 50, #FF4646, 255, "Default", "Entity");
  
  ecosystem = new Animal[50];
  
  for(int i = 0; i < ecosystem.length; i++){
    if(i % 3 == 0) path = "FU.png";
    else if(i % 3 == 1) path = "CYRUS.png";
    else path = "SEBA.png";
    
    ecosystem[i] = new Animal(random(width), random(height), 50, 50, #FF4646, 255, "Begone", "REEEEEE", 15, path);
    
    if(path == "SEBA.png") ecosystem[i].resize(0.135, 0.135);
    else ecosystem[i].resize(0.25,0.25);
  }
  
  for(int i = 0; i < ecosystem.length; i++){
    ecosystem[i].addCollidables(ecosystem);
  }
  
  System.out.println(ent.toString());
}

public void draw()
{
  background(255);
  for(int i = 0; i < ecosystem.length; i++){
    ecosystem[i].move();
    ecosystem[i].display();
  }
}*/