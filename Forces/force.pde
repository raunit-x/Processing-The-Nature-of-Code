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
    location = new PVector(random(width) / 2, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 2);
  }

  // Newton's second law!
  void applyForce(PVector f)
  {
    PVector force = PVector.div(f, mass);

    acceleration.add(force);
  }

  void display(int r, int g, int b)
  {
    stroke(255);
    fill(r, g, b);
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
}

Mover[] movers;
PVector gravity;
void setup()
{
  background(0);
  movers = new Mover[5];
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }


  size(640, 360);

}

void draw()
{
  background(0);
  int count = 0;
  for(Mover m : movers){
    count++;
    gravity = new PVector(0, 0.3);
    gravity.mult(m.mass);
    m.applyForce(gravity);

    // Let's apply friction!
    PVector friction = m.velocity.get();
    friction.normalize();

    // float c = -0.01; // coefficient of friction
    // friction.mult(c);
    // m.applyForce(friction);


    // Let's apply the drag force!
    if(mousePressed){
      PVector drag = m.velocity.get();
      drag.normalize();
      float c = -0.005;
      float speed = m.velocity.mag() * m.velocity.mag();
      drag.mult(c * speed);
      m.applyForce(drag);
    }


    // Wind force  
    if(mousePressed)
    {
     PVector wind = new PVector(0.2, 0);
     m.applyForce(wind);
    }


    m.update();
    m.checkEdges();
    m.display(count * 10 , count * 35 , count * 40);
  }

}
