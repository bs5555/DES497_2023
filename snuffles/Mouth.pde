class Mouth
{
  float x = width/2; 
  float y  = height-(height/4);
  float size = 200;
  float actual_size = 200;
  float min_size = 50;
  
  Amplitude amp;
  AudioIn in;
  
  Mouth(PApplet app,float _size)
  {
     size = _size;
     min_size = size / 5.0;
     actual_size = size;
     amp = new Amplitude(app);
     in = new AudioIn(app, 0);
     in.start();
     amp.input(in);
  }
  
  void update() 
  {
    actual_size = (amp.analyze()*size)+min_size;
    
  }
  
  void display()
  {
    pushMatrix();
      translate(x, y);
      noStroke();
      fill(0);
      circle(0,0,actual_size);
    popMatrix();
  }
  

}
