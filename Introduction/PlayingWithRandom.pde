class Walker
{
  float x;
  float y;

  Walker()
  {
    x = width / 2;
    y = height / 2;
  }

  void display()
  {
    stroke(random(5));
    point(x,y);
  }

  void step()
  {
      int choice = int(random(4));
      if (choice == 0)
      {
         x++;
      }
      else if (choice == 1)
      {
         x--;
      }
      else if (choice == 2)
      {
         y++;
      }
      else
      {
         y--;
      }

  }

}

Walker boy;

void setup()
{
  size(600, 600);
  background(255);
  boy = new Walker();
}

void draw()
{
   boy.step();
   boy.display();
}
