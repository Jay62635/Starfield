Particle[][] stars = new Particle[6][];
int index = 0;
void setup()
{
  size(500,500);
  background(30);
  noStroke();
  stars[index] = new Particle[2000];
  for (int i = 0;i<2000;i++){
    stars[index][i] = new Particle(250,250);
  }
  index += 1;
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
}
class Particle
{
  double myX,myY,myAngle,mySpeed;
  int myCol, myAlpha;
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

class OddballParticle 
{
  
}
