Particle[][] stars = new Particle[3][];
Particle[] oddballs = new OddballParticle[3];
int index = 0;
int odd_index = 0;
void setup()
{
  size(500,500);
  background(30);
  noStroke();
  stars[index] = new Particle[2000];
  for (int i = 0;i<2000;i++){
    stars[index][i] = new Particle(250,250);
  }
  oddballs[0] = new OddballParticle();
  index += 1;
  odd_index += 1;
}
void draw()
{
  background(30);
  for (int j = 0;j<stars.length;j++) {
    if(stars[j] == null){
      break;
    }
    for (int i = 0;i<2000;i++) {
      stars[j][i].move();
      stars[j][i].show();
    }
    oddballs[j].move();
    oddballs[j].show();
  }
}
void mousePressed()
{
  stars[index] = new Particle[2000];
  for (int i = 0;i<2000;i++){
    stars[index][i] = new Particle(mouseX, mouseY);
  }
  if (index == stars.length-1)
    index = 0;
  else
    index += 1;
  oddballs[odd_index] = new OddballParticle();
  if (odd_index == oddballs.length-1)
    odd_index = 0;
  else
    odd_index += 1;
}

class Particle
{
  double myX,myY,myAngle,mySpeed;
  int myCol, myAlpha;
  boolean light;
  Particle(){
    if(mouseX == 0 && mouseY == 0){
      myX = 250;
      myY = 250;
    }
    else{
      myX = mouseX;
      myY = mouseY;
    }
    myCol = #FFFFFF;
    myAngle = 0;
    mySpeed = 0;
    myAlpha = 100;
    light = false;
  }
  Particle(int x, int y) {
    myX = x;
    myY = y;
    myCol = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
    myAlpha = 255;
  }
  void move() {
    myX += Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed;
    myAlpha-=2;
  }
  void show() {
    fill(myCol,myAlpha);
    ellipse((float)myX,(float)myY,5,5);
  }
}

class OddballParticle extends Particle
{
  void show(){
    fill(myCol,myAlpha);
    ellipse((float)myX,(float)myY,25,25);
  }
  void move(){
    if (light == false){
      myAlpha+=5;
      if(myAlpha == 255)
        light = true;
    }
    else
      myAlpha -= 5;
  }
}
