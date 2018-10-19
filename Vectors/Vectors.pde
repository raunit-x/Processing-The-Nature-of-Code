// float x = 100;
// float y = 100;
// float xSpeed = 1;
// float ySpeed = 3.3;



class PVector
{
  float x;
  float y;

  PVector(float x_, float y_)
  {
    x = x_;
    y = y_;
  }

  void add(PVector v1)
  {
    x = x + v1.x;
    y = y + v1.y;
  }
}

PVector location;
PVector velocity;



void setup()
{
  size(640, 360);
  background(255);

  location = new PVector(100, 100);
  velocity = new PVector(10, 3.3);
}




void draw()
{
  background(255);

  location.add(velocity);

  if(location.x > width || location.x < 0)
  {
    velocity.x *= -1;
  }
  if(location.y > height || location.y < 0)
  {
    velocity.y *= -1;
  }
  stroke(0);
  fill(127);
  ellipse(location.x,location.y,20,20);
}
