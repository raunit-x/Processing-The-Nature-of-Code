
class Liquid {
  float x,y,w,h;
  float c;

  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }

  void display() {
    noStroke();
    fill(90);
    rect(x,y,w,h);
  }

}

class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float mass;

  // Constructor
  Mover()
  {
    location = new PVector(random(20, width - 20) / 2, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 2);
  }

  void applyForce(PVector f)
  {
    PVector force = PVector.div(f, mass);

    acceleration.add(force);
  }

  void display()
  {
    stroke(0);
    fill(50);
    ellipse(location.x,location.y, mass * 20, mass * 20);
  }

  void checkEdges()
  {
    if(location.x > width)
    {
      location.x = width;
      velocity.x *= -1;
    }
    else if(location.x < 0)
    {
      location.x = 0;
      velocity.x *= -1;
    }

    if(location.y > height)
    {
      location.y = height;
      velocity.y *= -1;
    }
    else if(location.y < 0)
    {
      location.y = 0;
      velocity.y *= -1;
    }
  }

  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void drag(Liquid l)
  {
    float speed = velocity.mag();
    float dragMag = l.c * speed * speed;
    PVector drag = velocity.get();
    drag.normalize();
    drag.mult(dragMag * - 1);
    applyForce(drag);
  }

  boolean isInside(Liquid l)
  {
    if(location.x > l.x && location.x < l.x + l.w && location.y > l.y && location.y < l.y + l.h){
      return true;
    }
    else return false;
  }
}


Mover[] movers = new Mover[5];
Liquid l;

void setup()
{
  size(600, 800);
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
  l = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw()
{
  background(255);
  l.display();
  for(int i = 0; i < movers.length; i++){
    if(movers[i].isInside(l)){
      movers[i].drag(l);
    }
    PVector gravity = new PVector(0, 0.1 * movers[i].mass);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}
