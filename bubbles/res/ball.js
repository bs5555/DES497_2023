class Ball {

  /*x, y;
  diameter;
  vx = 0;
  vy = 0;
  id;
  others;*/

  constructor(xin,yin,din,idin,oin) {
    this.x = xin;
    this.y = yin;
    this.diameter = din;
    this.id = idin;
    this.others = oin;
    this.vx = 0;
    this.vy = 0;
  }

  collide() {


    for (i = this.id + 1; i < numBalls; i++)
    {
      var dx = balls[i].x - this.x;
      var dy = balls[i].y - this.y;
      var distance = Math.sqrt(dx*dx + dy*dy);
      var minDist = balls[i].diameter/2 + this.diameter/2;
      if (distance < minDist) {
        var angle = Math.atan2(dy, dx);
        var targetX = this.x + Math.cos(angle) * minDist;
        var targetY = this.y + Math.sin(angle) * minDist;
        var ax = (targetX - balls[i].x) * spring;
        var ay = (targetY - balls[i].y) * spring;
        this.vx -= ax;
        this.vy -= ay;
        balls[i].vx += ax;
        balls[i].vy += ay;
      }
    }
    console.log(this.vx);
    console.log(this.vy);
    console.log('..');
    console.log(this.x);
    console.log(this.y);
    console.log('----');
  }



  /*collide() {

    for (i = this.id + 1; i < numBalls; i++) {
      var dx = this.others[i].x - this.x;
      var dy = this.others[i].y - this.y;
      var distance = Math.sqrt(dx*dx + dy*dy);
      var minDist = this.others[i].diameter/2 + this.diameter/2;
      if (distance < minDist) {
        var angle = Math.atan2(dy, dx);
        var targetX = this.x + Math.cos(angle) * minDist;
        var targetY = this.y + Math.sin(angle) * minDist;
        var ax = (targetX - this.others[i].x) * spring;
        var ay = (targetY - this.others[i].y) * spring;
        this.vx -= ax;
        this.vy -= ay;
        this.others[i].vx += ax;
        this.others[i].vy += ay;
      }
    }
  }*/

  move() {



    this.vy += this.gravity;
    this.x += this.vx;
    this.y += this.vy;



  if (this.x + this.diameter/2 > width) {
      this.x = width - this.diameter/2;
      this.vx *= friction;
    }
    else if (this.x - this.diameter/2 < 0) {
      this.x = this.diameter/2;
      this.vx *= friction;
    }
    if (this.y + this.diameter/2 > height) {
      this.y = height - this.diameter/2;
      this.vy *= friction;
    }
    else if (this.y - this.diameter/2 < 0) {
      this.y = this.diameter/2;
      this.vy *= friction;
    }
  }

  display()
  {
    ctx.fillStyle = '#f33';
    ctx.beginPath();
    ctx.ellipse(this.x, this.y, this.diameter, this.diameter, 0, 0, 2 * Math.PI);
    ctx.fill();

    //ctx.ellipse(this.x, this.y, this.diameter, this.diameter,0,0, 2 * Math.P);



  }
}
