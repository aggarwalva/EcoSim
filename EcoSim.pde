public ArrayList<Predator> predators;
public ArrayList<Prey> prey;
public ArrayList<Animal> ecosystem;
Predator tempPredator;
Prey tempPrey;
String path;
public int initPredatorPopulation = 2;
public int initPreyPopulation = 15;
public long time;
public int predatorStarve = 0, predatorBorn = 0;
public int totalNum = 0, preyNum = 0, predNum = 0;

public void setup()
{
  size(960, 540);
  //Create a basic entity at a random location on the canvas
  
  predators = new ArrayList<Predator>();
  prey = new ArrayList<Prey>();
  ecosystem = new ArrayList<Animal>();
  
  for(int i = 0; i < initPredatorPopulation; i++){
    createPredator();
  }
  
  for(int i = 0; i < initPreyPopulation; i++){
    createPrey();
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
  
  if(millis() - time > 5000){
    int preyBirths = ceil(prey.size()/3);
    for(int i = 0; i < preyBirths; i++){
       createPrey(); 
    }
    time = millis();
    predatorStarve++;
    
    System.out.println(preyBirths + " prey born");
    System.out.println(predatorBorn + " predators born");
    predatorBorn = 0;
  }
  
  if(predatorStarve > 1){
     predatorStarve = 0;
     
     for(Predator p : predators){
        if(p.hasReproduced()){
           p.reproduced(false); 
        } else{
           p.kill();
        }
     }
  }
  
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
          if(ecosystem.get(i).shouldReproduce()){
              ecosystem.get(i).reproduce();
              createPredator();
              predatorBorn++;
          }
       }
      
       ecosystem.get(i).move();
       ecosystem.get(i).display();
    }
  }
  
  if(ecosystem.size() == 0 || predators.size() == 0){
    try{
      wait(1000); 
    } catch(Exception e){
       
    }
    System.out.println("The ecological simulator has concluded. This ecosystem lasted " + millis()/1000 + " seconds and supported " + totalNum + " animals throughout its history, including " + predNum + " predators and " + preyNum + " prey");
    exit();
}
}

public void createPredator(){
  path = "SEBA.png";
  tempPredator = new Predator(random(width), random(height), 50, 50, #FF4646, 255, "Begone", "REEEEEE", 15, path);
  tempPredator.resize(0.135,0.135);
  predators.add(tempPredator);
  ecosystem.add(tempPredator);
  
  predNum++;
  totalNum++;
}

public void createPrey(){
  if(prey.size() % 2 == 0) path = "FU.png";
  else path = "CYRUS.png";
  
  tempPrey = new Prey(random(width), random(height), 50, 50, #FF4646, 255, "Begone", "REEEEEE", 15, path);
  tempPrey.resize(0.25,0.25);
  prey.add(tempPrey);
  ecosystem.add(tempPrey);
  
  preyNum++;
  totalNum++;
}