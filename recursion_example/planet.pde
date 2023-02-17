class planet
{
  float angle = 0.0;
  float dist = 100.0;
  float speed = 1.0;
  float size =  30.0;
  int nm = 0;
  planet[] moons;
  int gen = 0;

  planet(int _gen)
  {
    this.gen = _gen;
    this.angle = random(360);
    this.dist = random(50,600);
    this.speed = random(0.1,1);
    this.size = random(10,50);
    this.nm = floor(random(1,16));
    if(this.gen > 0)
    {
      this.moons = new planet[this.nm];
      for(int i = 0; i < this.nm; i = i + 1)
      {
        this.moons[i]=new planet(_gen - 1);
      }
    }  
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
     if(this.gen > 0)
     {
       for(int i = 0; i < nm; i = i + 1)
       {
         this.moons[i].display();
         this.moons[i].update();
       }  
     }
    popMatrix();  
  }


  
}
