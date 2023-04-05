class Facetracker
{
  PApplet app;
  float x = width/2;
  float y = height/2;
  Capture video;
  OpenCV opencv;
  
  Facetracker(PApplet _app)
  {
    app = _app;
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
      video = new Capture(app, cameras[0]);
      video.start();
      opencv = new OpenCV(app, 640, 480);
      opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
     
    }
  }
  
  void update()
  {
    video.read();
    opencv.loadImage(video);
    image(video, 0, 0 );
    Rectangle[] faces;
    faces = opencv.detect();
    //println(faces);
    float sum = 0;
    int index = -1;
    for (int i = 0; i < faces.length; i++) 
    {
      float buf = faces[i].width+faces[i].height;
      if(buf > sum)
      {
        sum = buf;
        index = i;
      }
    }
    if(index >= 0)
    {
      x = faces[index].x+(faces[index].width/2);
      y = faces[index].y+(faces[index].height/2);
      x = lerp(video.width,width,x/video.width);
      y = lerp(video.height,height,y/video.height);
    }
    
  }
  
  void display()
  {
    pushMatrix();
      translate(x,y);
      fill(color(255,0,0,100));
      circle(0,0,50);
    popMatrix();
  }
  
}
