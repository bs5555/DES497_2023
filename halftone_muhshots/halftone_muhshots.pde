
float max_distance;
PGraphics[] gr = new PGraphics[10];
float zoom  = 1.5;

void setup() {
  size(1200, 960,P3D); 
  noStroke();
  max_distance = dist(0, 0, width, height);
  gr[0]=createGraphics(round(width*zoom),round(height*zoom));
  gr[1]=createGraphics(round(width*zoom),round(height*zoom));
  gr[2]=createGraphics(round(width*zoom),round(height*zoom));
}

void draw() {
  background(255);
 
  drawC(0,mouseX,mouseY,color(255,0,128));
  drawC(1,width-mouseX,height-mouseY,color(0,128,255));
  drawC(2,width-mouseX/2,height-mouseY/2,color(255,255,0));
  tint(255,128);
  image(gr[0],0,0);
  pushMatrix();
    translate(width/2,height/2);
    rotate(radians(18));
    translate(-width/2,-height/2);
    image(gr[1],0,0);
  popMatrix();
  pushMatrix();
    translate(width/2,height/2);
    rotate(radians(-18));
    translate(-width/2,-height/2);
    image(gr[2],0,0);
  popMatrix();
}

void drawC(int grnum, float x, float y, color c)
{
  gr[grnum].beginDraw();
  gr[grnum].background(gr[grnum].color(255,0));
  gr[grnum].fill(c);
  gr[grnum].noStroke();
  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      float size = dist(x, y, i, j);
      size = size/max_distance * 66;
      //tint(255,128);
      gr[grnum].ellipse(i, j, size, size);
    }
  }
  gr[grnum].endDraw();
}
