int radius1 = int(750); //<>//
int radius2 = int(400);

class alien {
  int x, y, dx, dy, width, height;
  boolean discovered;
}
class agent {
  int x, y, dx, dy, width, height;
}

class people {
  int x, y, dx, dy, width, height;
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
  movePeople();
  moveAlien();
  moveAgent();
  ellipseMode(CENTER);
  fill(100);
  ellipse(500, 500, radius1, radius1);
  fill(0);
  ellipse(500, 500, radius2, radius2);
  closestPerson();
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


void makeAlien() {
  for (int i=0; i<aliens.length; i++) {
    aliens[i]=new alien();
    aliens[i].width = 35;
    aliens[i].height = 35;
    aliens[i].dx = 3;
    aliens[i].dy = 3;
    aliens[i].x= int(random(width));
    aliens[i].y= int(random(height));
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
  }     // tracking shite
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
  if (dist(width/2, height/2, x, y) >= radius2) { 
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


void moveAlien() {
  for (int i=0; i<aliens.length; i++) {
    image(alien, aliens[i].x+20, aliens[i].y+20, aliens[i].width, aliens[i].height);
    if (aliens[i].x>400) aliens[i].dx = aliens[i].dx *-1;
    aliens[i].y = aliens[i].y+aliens[i].dy;
    if (aliens[i].y>400) aliens[i].dy = aliens[i].dy*-1;
  }
}

void moveAgent() {
  for(int i=0; i<agents.length;i++) {
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
void makeAliens() {
}
void closestPerson() {
}