public ArrayList<Predator> predators;
public ArrayList<Prey> prey;
public ArrayList<Animal> ecosystem;
Predator tempPredator;
Prey tempPrey;
String path;
public int initPredatorPopulation = 2;
public int initPreyPopulation = 15;
public long time;
public int predatorStarve = 0, predatorBorn = 0, preyBorn = 0;
public int totalNum = 0, preyNum = 0, predNum = 0;
public double predatorSpeed, preyReproduce;

//Test Commit
public void setup()
{
  fullScreen();
  //size(960, 540);
  //Create a basic entity at a random location on the canvas
  
  predators = new ArrayList<Predator>();
  prey = new ArrayList<Prey>();
  ecosystem = new ArrayList<Animal>();
  
  for(int i = 0; i < initPredatorPopulation; i++){
    createPredator(random(9,11), random(90,110)); //90,110
  }
  
  for(int i = 0; i < initPreyPopulation; i++){
    createPrey(random(3000,5000));
  }
  
  for(int i = 0; i < ecosystem.size(); i++){
    ecosystem.get(i).addCollidables(ecosystem);
  }
  
  time = millis();
}

public void draw()
{ 
  background(255);
  
  for(int i = 0; i < ecosystem.size(); i++){
    ecosystem.get(i).addCollidables(ecosystem);
  }
  
  if(millis() - time > 3000){
    time = millis();
    predatorStarve++;
    
    System.out.println(preyBorn + " prey born");
    System.out.println(predatorBorn + " predators born");
    predatorBorn = 0;
    preyBorn = 0;
  }
  
  if(predatorStarve > 1){
     predatorStarve = 0;
     
     /*for(Predator p : predators){
        if(p.hasReproduced()){
           p.reproduced(false); 
        } else{
           p.kill();
        }
     }*/
  }
  
  predatorSpeed = 0;
  preyReproduce = 0;
  
  for(int i = 0; i < ecosystem.size(); i++){
    if(!ecosystem.get(i).isAlive()){
       if(ecosystem.get(i).getType() == "Prey"){
          prey.remove(ecosystem.get(i));
          ecosystem.remove(ecosystem.get(i));
       } else if(ecosystem.get(i).getType() == "Predator"){
          predators.remove(ecosystem.get(i));
          ecosystem.remove(ecosystem.get(i));
       }
    } else {
       if(ecosystem.get(i).getType() == "Predator"){
         predatorSpeed += ecosystem.get(i).getSpeed();
         if(ecosystem.get(i).shouldReproduce()){
              ecosystem.get(i).reproduce();
              createPredator(random(ecosystem.get(i).getSpeed() - 2, ecosystem.get(i).getSpeed() + 2), random(ecosystem.get(i).getSight() - 30, ecosystem.get(i).getSight() + 30));;
              predatorBorn++;
          }
       } else{
          if(ecosystem.get(i).getType() == "Prey"){
            preyReproduce += ecosystem.get(i).getReproduceTime();  
            if(ecosystem.get(i).shouldReproduce()){
              ecosystem.get(i).reproduce();
              createPrey(ecosystem.get(i).getReproduceTime() + random(-200, 200));
              preyBorn++;
          }
          }
       }
      if(ecosystem.get(i).getStarve() > 6000){
        ecosystem.get(i).kill();
      } else{
        ecosystem.get(i).move();
       ecosystem.get(i).display();
      }
    }
  }
  
  if(ecosystem.size() == 0 || predators.size() == 0){
    /*try{
      wait(1000); 
    } catch(Exception e){
       
    }*/
    System.out.println("The ecological simulator has concluded. This ecosystem lasted " + millis()/1000 + " seconds and supported " + totalNum + " animals throughout its history, including " + predNum + " predators and " + preyNum + " prey");
    exit();
  }
  text(frameRate, 100, 50);
  text(millis()/1000.0, 1180, 50);
  if(predators.size() != 0){
   text(predators.size() + "  " + (int)predatorSpeed/predators.size(), 100, 100); 
  }
  if(prey.size() != 0){
   text(prey.size() + "  " + (int)preyReproduce/prey.size(), 1180, 100); 
  }
}

public void createPredator(float speed, float sight){
  path = "SEBA.png";
  tempPredator = new Predator(random(width), random(height), 50, 50, #FF4646, 255, "Begone", "REEEEEE", 15, path, speed, sight);
  tempPredator.resize(0.135,0.135);
  predators.add(tempPredator);
  ecosystem.add(tempPredator);
  
  predNum++;
  totalNum++;
}

public void createPrey(float reproduce){
  if(prey.size() % 2 == 0) path = "FU.png";
  else path = "CYRUS.png";
  
  tempPrey = new Prey(random(width), random(height), 50, 50, #FF4646, 255, "Begone", "REEEEEE", 15, path, reproduce);
  tempPrey.resize(0.25,0.25);
  prey.add(tempPrey);
  ecosystem.add(tempPrey);
  
  preyNum++;
  totalNum++;
}