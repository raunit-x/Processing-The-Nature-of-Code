float speed;

class Star{
  float x;
  float y;
  float z;
  float pz;
  Star(){
    x = random(-width / 2, width / 2);
    y = random(-height / 2, height / 2);
    z = random(width);
    pz = z;
  }

  void update(){
    z = z - speed;
    //pz = z;
    if(z < 1){
      z = width;
      x = random(-width, width);
      y = random(-height, height);
      pz = z;
    }
  }
  void display(){

    fill(255);
    noStroke();
    float r = map(z, 0, width, 16, 0);
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    float psx = map(x / pz, 0, 1, 0, width);
    float psy = map(y / pz, 0, 1, 0, height);
    ellipse(sx, sy, r, r);
    stroke(255);
    pz = z;
    line(psx, psy, sx, sy);
  }
}

Star[] stars = new Star[800];


void setup(){
  size(800, 800);
  background(0);
  translate(width / 2, height / 2);
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
}
float psx, psy;
void draw(){
  translate(width / 2, height / 2);
  background(0);
  speed = map(mouseX, 0, width, 0, 20);
  for(int i = 0; i < stars.length; i++){
    stars[i].update();
   // stars[i].pz = stars[i].z;
    stars[i].display();
  }

}
