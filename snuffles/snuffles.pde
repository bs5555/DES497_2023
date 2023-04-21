import processing.sound.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Eye e1, e2;
Mouth m;
Facetracker f;

void setup() 
{
  size(640, 360);
  fullScreen();
  noStroke();
  e1 = new Eye( (width/2)-(width/8), height/2, height/4);
  e2 = new Eye( (width/2)+(width/8), height/2, round(height/4.5)); 
  //m = new Mouth(this,width/10);
  f = new Facetracker(this);
}

void draw() {
  background(102);
  
  f.update();
  e1.update(f.location.x, f.location.y);
  e2.update(f.location.x, f.location.y);
  m.update();

  f.display();
  e1.display();
  e2.display();
  m.display();
}
