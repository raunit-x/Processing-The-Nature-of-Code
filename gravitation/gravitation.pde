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
    location = new PVector(random(width), 0);
    velocity = new PVector(random(4.37, 5), 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 2);
  }

  // Newton's second law!
  void applyForce(PVector f)
  {
    PVector force = PVector.div(f, mass);

    acceleration.add(force);
  }

  void display()
  {
    strokeWeight(5);
    stroke(50);
    fill(240);
    ellipse(location.x,location.y, mass * 20, mass * 20);
    stroke(255);
    point(location.x, location.y);
  }
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
}

class Attractor
{
  float mass;
  PVector location;
  float G;

  Attractor(){
    location = new PVector(width / 2, height / 2);
    mass = 20;
    G = 1.5;
  }

  PVector attract(Mover m){
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);

    force.normalize();
    float strength = (G * m.mass * mass) / (distance * distance);
    force.mult(strength);
    return force;
    }

  void display(){
    strokeWeight(3);
    stroke(100);
    fill(10, 100, 100);
    ellipse(location.x, location.y, mass * 10, mass * 10);
  }

}


Mover[] movers = new Mover[10];
Attractor a;
PGraphics canvas;
float px2, py2;

void setup(){
  size(900, 800);
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
  a = new Attractor();
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();
}

void draw(){
  background(0);
  imageMode(CORNER);
  image(canvas, 0, 0, width, height);

  for(int i = 0; i < movers.length; i++){
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].update();
    a.display();
    movers[i].display();
  }
  // canvas.beginDraw();
  // canvas.stroke(100);
  // if (frameCount > 1) {
  //   canvas.line(px2, py2, m.location.x, m.location.y);
  // }
  // canvas.endDraw();
  // px2 = m.location.x;
  // py2 = m.location.y;
}
