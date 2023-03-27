PFont myFont;

void setup() 
{
  size(1200, 900);
  myFont = createFont("Lobster-Regular.ttf",100);
}

void draw()
{
  background(100);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  fill(color(255,130,130));
  textFont(myFont);
  textAlign(LEFT, CENTER);
  textSize(mouseX);
  text("Lorem ipsum\nDolor sit amet", width/2, height/2);
}
