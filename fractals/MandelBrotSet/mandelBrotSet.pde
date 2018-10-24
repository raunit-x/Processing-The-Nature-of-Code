void setup(){
  size(1200, 800);
  colorMode(RGB, 1);
}

void draw(){
  background(255);

  float w = 5;
  float h = (w * height) / width;

  float xmin = -w/2;
  float ymin = -h/2;


  loadPixels();

  int maxIterations = 100;

  float xMax = xmin + w;
  float yMax = ymin + h;
  float dx = (xMax - xmin) / (width);
  float dy = (yMax - ymin) / (height);

  float y = ymin;

  for(int j = 0; j < height; j++){
    float x = xmin;
    for(int i = 0; i < width; i++){
      float a = x;
      float b = y;
      int n = 0;
      while(n < maxIterations){
        float aa = a * a;
        float bb = b * b;
        float twoab = 2 * a * b;
        a = aa - bb + x;
        b = twoab + y;
        if(aa + bb > 16){
          break;
        }
        n++;
      }
      if(n == maxIterations){
        pixels[i + j * width] = color(0);
      }
      else {
        pixels[i + j * width] = color(0, (float(n) / maxIterations), (float(n) / maxIterations));
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
}
