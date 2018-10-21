class Rain
{
  PVector location;
  PVector velocity;
  Rain(float v){
    location = new PVector(random(width), 0);
    velocity = new PVector(0, v);
  }
  void checkEdges(){
    if(location.y > height){
      location.y = 0;
    }
  }

  void update(){
    location.add(velocity);
  }

  void display(int x, int y){
    fill(255, 0, 255);
    rect(location.x, location.y, x, y);
  }
}

Rain[] drops = new Rain[30];

void setup(){
  background(0);
  size(600, 800);
  for(int i = 0; i < drops.length; i++){
    drops[i] = new Rain(i * 0.05);
  }
}

void draw(){
  background(0);
  for(int i = 0; i < drops.length; i++){
    drops[i].update();
    drops[i].checkEdges();
    int x = map(i * 0.5, 0, 15, 5, 10);
    int y = map(i * 3, 0, 45, 25, 40);
    drops[i].display(x, y);
  }
}
