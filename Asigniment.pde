int radius1 = int(400); //<>// //<>//
int radius2 = int(200);
int selectedPerson=0;
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
  moveAgents();
}

void makePeople() {
  for (int i=0; i<peoples.length; i++) {
    peoples[i]=new people();
    peoples[i].width = 25;
    peoples[i].height = 25;
    peoples[i].dx = 0;
    peoples[i].dy = 0;
    peoples[i].x= int(random(width-10));
    peoples[i].y= int(random(height-10));
    while (inTrackingZone(peoples[i].x, peoples[i].y)==true) {
      peoples[i].x= int(random(width+10));
      peoples[i].y= int(random(height+10));
    }
  }
}
void movePeople() {
  for (int i=0; i<peoples.length; i++) {
    peoples[i].x=peoples[i].x+peoples[i].dx;
    peoples[i].y= peoples[i].y+peoples[i].dy;
    image(people, peoples[i].x, peoples[i].y, peoples[i].width, peoples[i].height);
    if (peoples[i].x>width||peoples[i].x<0) {
      peoples[i].dx=peoples[i].dx*-1;
    }
    if (peoples[i].y>height||peoples[i].y<0) {
      peoples[i].dy=peoples[i].dy*-1;
    }
    fill(0);
    text(i, peoples[i].x, peoples[i].y);
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



void makeAgents() {
  for (int i=0; i<agents.length; i++)
  {
    agents[i]=new agent();
    agents[i].width=50;
    agents[i].height=50;
    agents[i].dx=2;
    agents[i].dy=2;
    agents[i].x=int(random(width));
    agents[i].y=int(random(height));
    while (inTrackingZone(agents[i].x, agents[i].y) ==false) {
      agents[i].x=int(random(width-50));
      agents[i].y=int(random(height-50));
    }
  }

  // tracking shite
}
void newLevel() {
  makePeople();
  makeAgents();
  makeAliens();
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode== LEFT) {
      peoples[selectedPerson].dx =-1;
    } else if (keyCode==RIGHT) {
      peoples[selectedPerson].dx = 1;
    } else if (keyCode==UP) {
      peoples[selectedPerson].dy =-1;
    } else if (keyCode==DOWN) {
      peoples[selectedPerson].dy = 1;
    }
  } else {   
    if (key=='0' || key=='1' || key=='2' || key=='3' || key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9') {
      selectedPerson = key-'0'; //minus the ascii value
      println(selectedPerson);
    }
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

void moveAgents() {
  for (int i=0; i<agents.length; i++) {
    image(agent, agents[i].x, agents[i].y, agents[i].width, agents[i].height);
  }
}

/*boolean isTouchingAlien(int x, int y) { 
if (dist()) {
 }
 return true;
 return false;
}
*/
void closestPerson() {
}
