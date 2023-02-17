class planet
{
  float angle = 0.0;
  float dist = 100.0;
  float speed = 1.0;
  float size =  30.0;

  planet()
  {
    this.angle = random(360);
    this.dist = random(50,600);
    this.speed = random(0.5,3);
    this.size = random(10,50);
  }

  void update()
  {
    this.angle = this.angle + this.speed;
  }
  
  void display()
  {
    pushMatrix();
     rotate(radians(this.angle));
     translate(this.dist,0);
     circle(0,0,this.size);
    popMatrix();  
  }


  
}
