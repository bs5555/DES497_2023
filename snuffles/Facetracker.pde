class Facetracker
{
  PApplet app;
  float x = width/2;
  float y = height/2;
  Capture video;
  OpenCV opencv;
  PVector location = new PVector(width/2,height/2);
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  
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
      PVector face = new PVector(0,0);
      
      face.x = faces[index].x+(faces[index].width/2);
      face.y = faces[index].y+(faces[index].height/2);
      
      pushMatrix();
        translate(face.x,face.y);
        fill(color(100,100,255,100));
        circle(0,0,50);
      popMatrix();
      
      face.x = lerp(0,width,face.x/video.width);
      face.y = lerp(0,height,face.y/video.height);
      
      //face.x=mouseX;
      //face.y=mouseY;
      
      pushMatrix();
        translate(face.x,face.y);
        fill(color(100,100,255,100));
        circle(0,0,50);
      popMatrix();
      
      this.acceleration = PVector.sub(face,this.location);
      float d = acceleration.mag();
      this.acceleration.normalize();
      this.acceleration.mult(d);
      this.velocity.add(acceleration);
      velocity.limit(width/100.0);
      this.location.add(this.velocity);
    }
    
  }
  
  void display()
  {
    pushMatrix();
      translate(this.location.x,this.location.y);
      fill(color(255,0,0,100));
      circle(0,0,50);
    popMatrix();
  }
  
}
