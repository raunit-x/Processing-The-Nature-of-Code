void setup(){
  size(1200, 800);
  colorMode(HSB, 1);
  translate(-30, 30);
}

void draw(){
  
  //float ca = map(mouseX, 0, width, -1, 1);
  //float cb = map(mouseY, 0, height, -1, 1);
  float ca = -0.8;
  float cb = 0.156;
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
        a = aa - bb + ca;
        b = twoab + cb;
        if(aa + bb > 16){
          break;
        }
        n++;
      }
      if(n == maxIterations){
        pixels[i + j * width] = color(0);
      }
      else {
        float hu = sqrt(float(n) / maxIterations);
        pixels[i + j * width] = color(hu, 255, 255);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  //println(frameRate);
}
