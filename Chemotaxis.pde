Bacteria kevin = new Bacteria();
 void setup()   
 {     
size(800,800);
background(255);
 }   
 void draw()   
 {    
kevin.show();
kevin.grow();
 }  
 class Bacteria    
 {     
double x,y;
int grn;

Bacteria()
{
x = 400.0;
grn = color(0,255,0); 
y = 800.0;
 }  
 void show(){
fill(grn);
noStroke();
ellipse((float)x,(float)y,5,5);

 }
 void grow(){
x = x + Math.random()*(-3)+1.5;
y = y + Math.random()*(-3)+1.5;
 }
   }
