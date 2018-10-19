int [] randomCounts;


void setup()
{
  size(640, 360);
  randomCounts = new int[20];
}

void draw()
{
  background(255);
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  int w = width / randomCounts.length;
  stroke(0);
  fill(random(255), random(255), random(255));
  for(int x = 0; x < randomCounts.length; x++)
  {
    rect(x * w, height - randomCounts[x], w, randomCounts[x]);
  }
}
