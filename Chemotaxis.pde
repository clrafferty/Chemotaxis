Bacteria [] kevin = new Bacteria[25];
float sunx = mouseX;
float suny = 100 ; 
 void setup()   
 {     
size(800,800);
background(255);
for (int i = 0; i<25;i++)
	kevin[i]= new Bacteria();
 }   
 void draw()   
 {    
 	background(255);
 	 sunx = mouseX;
 	//sun
 	pushMatrix();
 	translate(sunx,suny);
 	for(int i = 0 ; i < 10; i ++){
 	fill(255, 154, 3);
 	triangle(-10,20, 10, 20, 0, 35);
 	rotate(2*PI/10);
 }
 	popMatrix();
 	fill(255, 221, 3);
ellipse(sunx,suny,50,50);

 	//end sun
 	for(int i = 0; i<25;i++){
 		kevin[i].show();
		kevin[i].grow();
 	}

 }  
 class Bacteria    
 {     
double x,y;
int grn;
boolean grown;

Bacteria()
{
x = 400.0;
grn = color(76, 217, 90); 
y = 800.0;

 }  
 void show(){
fill(grn);
noStroke();
ellipse((float)x,(float)y,5,5);
stroke(grn);
strokeWeight(6);
line((float) x , (float) y,400,800);
noStroke();

 }
 void grow(){
 	if(y>100)
{x = x + Math.random()*(-5)+2.5;
y = y + Math.random()*(-3)+1;
}
 }
   }
