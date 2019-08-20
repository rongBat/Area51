int radius1 = int(400); //<>//
int radius2 = int(200);

class alien {
  int x, y, dx, dy, width, height;
  boolean discovered;
}
class agent {
  int x, y, dx, dy, width, height;
}

class people {
  int x, y, dx, dy, width, height;
  boolean inArea51, inTrackingZone;
}
alien[] aliens=new alien[20];
agent[] agents=new agent[int(1)];
people[] peoples = new people[int(15)];
PImage people, alien, agent; 



void setup() {  
  size(1000, 1000);
  people = loadImage("people.jpg");
  alien = loadImage("Alien.jpg");
  agent = loadImage("aGNET.jpg");
  newLevel();
}


void draw() {
  background(100);
  ellipseMode(CENTER);
  fill(100);
  ellipse(500, 500, radius1*2, radius1*2);
  fill(0);
  ellipse(500, 500, radius2*2, radius2*2);
  closestPerson();
  movePeople();
  moveAliens();
  moveAgent();
}

void makePeople() {
  for (int i=0; i<peoples.length; i++) {
    peoples[i]=new people();
    peoples[i].width = 25;
    peoples[i].height = 25;
    peoples[i].dx = 3;
    peoples[i].dy = 3;
    peoples[i].x= int(random(width-10));
    peoples[i].y= int(random(height-10));
  }
}
void movePeople() {
  for (int i=0; i<peoples.length; i++) {
    image(people, peoples[i].x, peoples[i].y, peoples[i].width, peoples[i].height);
  }
}


void makeAliens() {
  for (int i=0; i<aliens.length; i++) {
    aliens[i]=new alien();
    aliens[i].width = 35;
    aliens[i].height = 35;
    aliens[i].dx = int(random(5)+1);
    aliens[i].dy = int(random(5)+1);
    aliens[i].x= int(random(width));
    aliens[i].y= int(random(height));
    while (inArea51(aliens[i].x, aliens[i].y)==false) {
      aliens[i].x=int(random(width));
      aliens[i].y= int(random(height));
    }
  }
}



void makeAgent() {
  for (int i=0; i<agents.length; i++)
  {
    agents[i]=new agent();
    agents[i].width=50;
    agents[i].height=50;
    agents[i].dx=2;
    agents[i].dy=2;
    agents[i].x=int(random(radius2));
    agents[i].y=int(random(radius2));
  } 
  // tracking shite
}
void newLevel() {
  makePeople();
  makeAgents();
  makeAliens();
}

void keyPressed(int x, int y) {
  if (key==CODED) {
    while (keyCode== LEFT) {
      println("aaa");
    }
  } else if (keyCode==RIGHT) {
    println("ddd");
  } else if (keyCode==UP) {
    println("www");
  } else if (keyCode==DOWN) {
    println("sss");
  }
}
boolean inArea51(int x, int y) {
  if (dist(width/2, height/2, x, y) >= radius2-50) {
    return false;
  } else {
    return true;
  }
}
boolean inTrackingZone (int x, int y) {
  if (dist(width/2, height/2, x, y) >= radius1) {
    return false;
  } else {

    return true;
  }
}


void moveAliens() {
  for (int i=0; i<aliens.length; i++) {
    image(alien, aliens[i].x-10, aliens[i].y-10, aliens[i].width, aliens[i].height);
    aliens[i].x = aliens[i].x + aliens[i].dx;
    aliens[i].y = aliens[i].y+aliens[i].dy;
    if (inArea51(aliens[i].x, aliens[i].y) == false) { 
      aliens[i].dx = aliens[i].dx *-1;
      aliens[i].dy = aliens[i].dy *-1;
    }
  }
}

void moveAgent() {
  for (int i=0; i<agents.length; i++) {
    agents[i]=new agent();
    image(agent, agents[i].x, agents[i].y, agents[i].width, agents[i].height);
  }
}

//boolean isTouchingAlien() { 
//if (dist()) {
// }
// return true;
// return false;
//}
void makeAgents() {
}
void closestPerson() {
}
