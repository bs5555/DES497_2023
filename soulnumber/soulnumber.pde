import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
int videox = 0;
int videoy = 0;
ArrayList<PImage> icons = new ArrayList<PImage>();
ArrayList<PImage> imgs = new ArrayList<PImage>();
int iconx = 0;
PImage face = createImage(300,300,RGB);
int facex = 0;
int facey = 0;
int faced = 300;
int facel = faced*faced;
int recorded = 0;
float[] bufr = new float[facel];
float[] bufg = new float[facel];
float[] bufb = new float[facel];
int bufmax = 0;

void setup() 
{
  //production setup begin
  fullScreen(2);
  //production setup end
  
  //developer setup begin
  //size(1880, 400);  // size always goes first!
  //developer setup end
  
  background(0,0,0);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  videox=(((width/3)-640)/2)-9;
  videoy=(height-480)/2;
  iconx=width/3;
  faced = 300;
  facex = (((width/3)-faced)/2)+((width/3)*2);
  facey = (height-faced)/2;
  
  video.start();
}

void draw() {
  //scale(2);
  opencv.loadImage(video);

  image(video,videox,videoy);

  noFill();
  stroke(255, 255, 255);
  strokeWeight(1);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);
  for (int i = 0; i < faces.length; i++) 
  {
    if(faces[i].width > 100)
    {
      int fx = faces[i].x-(faces[i].width/2)+videox; 
      int fy = faces[i].y-(faces[i].height/2)+videoy;
      int dx = faces[i].width*2;
      int dy = faces[i].height*2;
      if(fx+dx > 640+videox) fx=fx+((640+videox)-(fx+dx));
      if(fy+dy > height) fy=fy+(height-(fy+dy));
      if(fx<0) fx=0;
      if(fy<0) fy=0;
      
      PImage img = get(fx, fy, dx, dy);
      face.copy(img,0,0,img.width,img.height,0,0,faced,faced);
      //image(face,facex,facey,faced,faced);
      icons.add(img);
      if(icons.size() > 100) icons.remove(0);
      imageIn(face);
      //tint(255,12);
      //blend(img,0,0,faces[i].width*2,faces[i].height*2,facex,facey,faced,faced,SCREEN);
      //tint(255,255);
      //img.save(savePath(insertFrame("portrait/a########.png")));
    }  
  }
  for (int i = 0; i < faces.length; i++) 
  {
    ellipse(faces[i].x+(faces[i].width/2)+videox, faces[i].y+(faces[i].height/2)+videoy, faces[i].width, faces[i].height);
  }
  drawIcons();
  //drawgrid();
}

void imageIn(PImage img)
{
  img.loadPixels();
  bufmax++;
  PImage im = createImage(faced,faced,RGB);
  img.loadPixels();
  println(img.width);
  println(img.height);
  println("--");
  for(int i=0; i<facel; i++)
  {
    float r = img.pixels[i] >> 16 & 0xFF;
    float g = img.pixels[i] >> 8 & 0xFF;
    float b = img.pixels[i] & 0xFF;
    bufr[i]=bufr[i]+r;
    bufg[i]=bufg[i]+g;
    bufb[i]=bufb[i]+b;
    im.pixels[i]=color(bufr[i]/bufmax,bufg[i]/bufmax,bufb[i]/bufmax);
  }
  image(im,facex,facey,faced,faced);
  //println(bufmax);
}

void drawIcons()
{
  int x =0;
  int y =0;
  for(int i=icons.size()-1; i > 0 ; i--)
  {
    image(icons.get(i),x+iconx+12,y,50,50);
    x = x+50;
    if(x > (width/3)-50)
    {
      x=0;
      y=y+50;
    }
  }
}

void drawgrid()
{
  rect(0,0,(width/3)-1,height-1);
  rect((width/3)-1,0,(width/3)-1,height-1);
  rect(((width/3)*2)-1,0,(width/3)-1,height-1);
}

void captureEvent(Capture c) {
  c.read();
}
