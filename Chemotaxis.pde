Bacteria [] kevin = new Bacteria[50];
float sunx = mouseX;
float suny = 50 ; 
int growncount = 0;
int [] starx = new int[50];
int [] stary = new int [50];

void setup()   
{     
  size(800, 800);
  background(255);
  for (int i = 0; i<50; i++)
    kevin[i]= new Bacteria();
  for (int i = 0; i < 50; i ++) {
    starx[i] =(int)( Math.random()*800);
    stary[i] =(int)( Math.random()*800);
  }
}   
void draw()   
{    
  background(255);
  sunx = mouseX;
  if (growncount<25) {
    sunrise();
    sun(sunx, suny);
  } else {
    sunset(starx,stary);
    moon(sunx, suny);
  }
  noStroke();
  growncount=0;
  for (int i = 0; i<50; i++) {
    kevin[i].show();
    //    kevin[0].grn=color(255, 0, 0);
    kevin[i].grow();
    if (kevin[i].grown==true)
      growncount+=1;
  }
  //System.out.println(kevin[0].max);
}  
class Bacteria    
{     
  double x, x0, y, max, rol, speedx, speedy;
  int grn;
  boolean grown;

  Bacteria()
  {
    x = Math.random()*800.0;
    //x=400;
    x0=x;
    grn = color(76, 217, 90); 
    y = 800.0-Math.random()*40-20;
    max = (Math.random()*600)+120;
    rol=0;
    speedx = Math.random()*-0.4;
    speedy =Math.random()* -2;
    grown = false;
  }  
  void show() {
    fill(grn);
    noStroke();
    ellipse((float)x, (float)y, 5, 5);
    stroke(grn);
    strokeWeight(6);
    line((float) x, (float) y, (float)x0, 800);
    noStroke();
    flower((float) x, (float) y);
  }
  void grow() {
    if (x<mouseX)
      rol = -1;
    else
      rol = 1;
    if (y>800-max)
    {
      x = x + speedx*(rol);
      y = y + speedy;
    } else
      grown = true;
  }
}
void flower(float x, float y) {
  pushMatrix();
  translate((float)x, (float) y);
  for (int i = 0; i < 20; i ++) {
    fill(255, 221, 0);
    strokeWeight(0.5);
    stroke(255, 221, 0);
    arc(0, 5, 5, 35, PI/2-.3, 3*PI/2-.3);
    arc(0, 5, 5, 35, -PI/2-.3, PI/2-.3);
    rotate(2*PI/20);
  }
  popMatrix();
  fill(54, 41, 21);
  ellipse((float)x, (float)y, 25, 25);
}
void sun (float sunx, float suny) {
  pushMatrix();
  translate(sunx, suny);
  for (int i = 0; i < 10; i ++) {
    fill(255, 154, 3);
    triangle(-10, 20, 10, 20, 0, 35);
    rotate(2*PI/10);
  }
  popMatrix();
  fill(255, 221, 3);
  ellipse(sunx, suny, 50, 50);
}
void sunrise() {
  for (int i = 0; i<800; i++)
  {
    stroke(81+i*164/800, 71+i*102/800, 255-i*189/800);
    line(0, i, 800, i);
  }
}
void star(int sx, int sy) {
  noStroke();
  float radop =sx/800;
  pushMatrix();
  fill(255, 255, 255, radop+10);
  ellipse(sx, sy, radop, radop);
  popMatrix();
}
void sunset(int[]starsx, int[]starsy) {
  background(32, 26, 153);
  noStroke();
  for (int i = 0; i < 50; i++) {
    star(starsx[i], starsy[i]);
  }
}
void moon( float moonx, float moony) {
  fill(255);
  noStroke();
  ellipse(moonx, moony, 50, 50);
  fill(32, 26, 153);
  ellipse(moonx+20, moony, 40, 40);
}
