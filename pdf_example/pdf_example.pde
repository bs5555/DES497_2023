import processing.pdf.*;

void setup() {
  size(400, 400);
  noLoop();
  beginRecord(PDF, "filename.pdf");
}

void draw() {
  // Draw something good here
  for(int x = 0; x < width; x = x + 10)
  {
    for(int y = 0; y < height; y = y + 10)
    {
      pushMatrix();
      translate(x,y);
      rotate(radians(x/10 + y/10));
      rect(0,0,5,5);
      popMatrix();
    }
  }
 

  endRecord();
}
