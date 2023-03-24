import processing.sound.*;
SoundFile file;
Waveform waveform;
int samples = 1000;
Env env;
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.4;
 

void setup() {
  size(640, 360);
  background(255);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "x.mp3");
  //file.play();
  waveform = new Waveform(this, samples);
  waveform.input(file);
  env  = new Env(this); 
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
  //triOsc.freq(((float)mouseX/width)*1000.0);
  file.play();
  env.play(file, attackTime, sustainTime, sustainLevel, releaseTime);
}
