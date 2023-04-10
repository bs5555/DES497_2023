PVector location = new PVector(100,200);
PVector velocity = new PVector(0,0);
PVector acc = new PVector(0,0);
  
void setup()
{
  size(1200,800);
}

void draw()
{
  background(100);
  noStroke();
  fill(color(255,0,100,100));
  
  //acc.x = mouseX;
  //acc.y = mouseY;
  acc.x = random(width);
  acc.y = random(height);
  
  acc.sub(location);
  acc.limit(1);
  velocity.add(acc);
  location.add(velocity);
  
  circle(location.x,location.y,60);
  
  if(location.x < 0) location.x = width;
  if(location.x > width) location.x = 0;
  if(location.y < 0) location.y = height;
  if(location.y > height) location.y = 0;
  velocity.limit(10);
  
}
