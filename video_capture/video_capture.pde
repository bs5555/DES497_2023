import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

Capture cam;
OpenCV opencv;
Rectangle[] faces;

void setup() {
  size(640, 480,P3D);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) 
  {
    println("There are no cameras available for capture.");
    exit();
  } 
  else 
  {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
  }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start(); 
    //Create the openCV object
    opencv = new OpenCV(this, cam);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  }      
}

void draw() {
  if(cam.available() == true) 
  {
    cam.read();
    opencv.loadImage(cam);
    faces = opencv.detect();
    println(faces);
  }
  image(cam, 0, 0);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}
