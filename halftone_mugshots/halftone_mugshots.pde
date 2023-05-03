import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
float max_distance;
PGraphics[] gr = new PGraphics[10];
PImage[] images = new PImage[3];
PGraphics red;
PGraphics green;
PGraphics blue;

void setup() {
  size(1200, 960,P3D);
  //fullScreen(P3D);
  noStroke();
  max_distance = dist(0, 0, width, height);
  gr[0]=createGraphics(width,height);
  gr[1]=createGraphics(width,height);
  gr[2]=createGraphics(width,height);
  red = createGraphics(512,512);
  green = createGraphics(512,512);
  blue = createGraphics(512,512);
  cameraInit();
  red.beginDraw();
  red.image(loadImage("a01.jpg"),0,0);
  red.endDraw();
  green.beginDraw();
  green.image(loadImage("a02.jpg"),0,0);
  green.endDraw();
  blue.beginDraw();
  blue.image(loadImage("a03.jpg"),0,0);
  blue.endDraw();
}

void draw() {
 
  //image(blue,0,0);
  //image(green,600,0);
  //image(red,0,600);
  
  video.read();
  opencv.loadImage(video);
  Rectangle[] faces;
  faces = opencv.detect();
  image(video,0,0);
   background(255);
  println(faces.length);
  if(faces.length > 1)
  {
    for(int i = 0; i < faces.length; i = i + 1)
    {
      PImage buf = createImage(512,521,RGB);
      buf.copy(video,faces[i].x,faces[i].y,faces[i].width,faces[i].height,0,0,512,512);
      //image(buf,500,0);
      if(i==0) 
      {
        red.beginDraw();
        red.image(buf,0,0);
        red.endDraw();
      } 
      if(i==1) 
      {
        green.beginDraw();
        green.image(buf,0,0);
        green.endDraw();
      }  
      if(i==2) 
      {
        blue.beginDraw();
        blue.image(buf,0,0);
        blue.endDraw();
      }  
    }
  }
  
  drawC(0,color(255,0,128),0,red);
  drawC(1,color(0,128,255),18,green);
  drawC(2,color(255,255,0),-18,blue);
  blendMode(MULTIPLY);
  image(gr[0],0,0);
  image(gr[1],0,0);
  image(gr[2],0,0);
 
}

void drawC(int grnum, color c, float angle, PGraphics buf)
{
  gr[grnum].beginDraw();
  gr[grnum].pushMatrix();
  gr[grnum].background(gr[grnum].color(255,0));
  gr[grnum].translate(width/2,height/2);
  gr[grnum].rotate(radians(angle));
  gr[grnum].translate(-width/2,-height/2);
  gr[grnum].fill(c);
  gr[grnum].noStroke();
  
  for(int i = -300; i <= width+300; i += 20) {
    for(int j = -300; j <= height+300; j += 20) {
      //float size = dist(x, y, i, j);
      //size = size/max_distance * 66;
      
      //(width+600) : 512 = i : x
      int x = (i * 512) / ( width );
      int y = (j * 512) / ( height );
      float val = brightness(buf.get(x,y));
      float size = val / 10.0;
      gr[grnum].ellipse(i, j, size, size);
    }
  }
  gr[grnum].popMatrix();
  gr[grnum].endDraw();
}

void cameraInit()
{
String[] cameras = Capture.list();
    if (cameras.length == 0) 
    {
      println("There are no cameras available for capture.");
      //exit();
    } 
    else 
    {
      println("Available cameras:");
      for (int i = 0; i < cameras.length; i++) 
      {
        println(cameras[i]);
      }
      video = new Capture(this, cameras[0]);
      video.start();
      opencv = new OpenCV(this, 640, 480);
      opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
     
    }
}
