import processing.sound.*;

SawOsc triOsc;
Env env;
Waveform waveform;

float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.4;

int samples = 1000;

void setup() {
  size(640, 360);
  background(255);
  
  // Create triangle wave
  triOsc = new SawOsc(this);

  // Create the envelope 
  env  = new Env(this); 
  waveform = new Waveform(this, samples);
  waveform.input(triOsc);
 
}      

void draw() {
   background(0);
  stroke(255);
  strokeWeight(2);
  noFill();
   waveform.analyze();

  beginShape();
  for(int i = 0; i < samples; i++)
  {
    vertex(
      map(i, 0, samples, 0, width),
      map(waveform.data[i], -1, 1, 0, height)
    );
  }
  endShape();
}

void mousePressed() {
  triOsc.freq(((float)mouseX/width)*1000.0);
  triOsc.play();
  env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
}
