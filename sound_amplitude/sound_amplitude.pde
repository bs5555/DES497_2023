import processing.sound.*;

Amplitude amp;
AudioIn in;

void setup() {
  size(640, 360);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}      

void draw() {
  background(0);
  noStroke();
  circle(width/2,height/2,amp.analyze()*height);
  println(amp.analyze());
}
