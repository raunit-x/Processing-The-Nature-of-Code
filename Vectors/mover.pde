class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;

  float topSpeed;

  // Constructor
  Mover()
  {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(-.001, 0.01);
    topSpeed = 10;
  }

  void update()
  {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void display()
  {
    stroke(0);
    fill(127);
    ellipse(location.x,location.y, 16, 16);
  }

  void checkEdges()
  {
    if(location.x > width){
      location.x = 0;
    }
    else if(location.x < 0)
    {
      location.x = width;
    }

    if(location.y > height){
      location.y = 0;
    }
    else if(location.y < 0){
      location.y = height;
    }
  }

}

Mover ball;

void setup()
{
  size(640, 360);
  ball = new Mover();
}

void draw()
{
  background(255);
  ball.update();
  ball.display();
  ball.checkEdges();
}
