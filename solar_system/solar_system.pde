int nc = 10;
float[] angle = new float[nc];
float[] dist = new float[nc];
float[] speed = new float[nc];

void setup()
{
  size(800,600); 
  for(int i = 0; i < nc; i = i + 1)
  {
    angle[i]=0.0;
    dist[i]=random(10,400);
    speed[i]=random(1,3);
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
    pushMatrix();
      rotate(radians(angle[i]));
      translate(dist[i],0);
      circle(0,0,50);
    popMatrix();  
    angle[i] = angle[i] + speed[i];
  }
}
