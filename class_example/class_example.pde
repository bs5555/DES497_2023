int nc = 10;
planet[] planets = new planet[nc];

void setup()
{
  size(800,600); 
  for(int i = 0; i < nc; i = i + 1)
  {
    planets[i]=new planet();
  }
} 

void draw()
{
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
  fill(255);
  translate(width/2,height/2);
  scale(0.5);
  
  for(int i = 0; i < nc; i = i + 1)
  {
    planets[i].display();
    planets[i].update();
  }
}
