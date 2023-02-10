int nc = 100;  

float[] dx = new float[nc];
float[] sx = new float[nc];
float[] dy = new float[nc];
float[] sy = new float[nc];



void setup()
{
  size(800,600);
  
  for(int i = 0; i < nc; i = i + 1)
  {
    dx[i]=0.0;
    dy[i]=0.0;
    sx[i]=random(1,5);
    sy[i]=random(1,5);
  }
}

void draw()
{
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
  fill(255);
  for(int i = 0; i < nc; i = i + 1)
  {
    circle(dx[i],dy[i],10);
    dx[i] = dx[i] + sx[i];
    if(dx[i] > width || dx[i] < 0) 
    {
      sx[i] = sx[i] * (-1);
    }
    dy[i] = dy[i] + sy[i];
    if(dy[i] > height || dy[i] < 0) 
    {
      sy[i] = sy[i] * (-1);
    }
  }
}
