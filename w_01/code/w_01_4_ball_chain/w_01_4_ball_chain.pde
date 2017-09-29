float spring = 0.4;
float friction = 0.3;

ArrayList<Ball> balls = new ArrayList<Ball>();

class Ball{
  float x, y;
  float xspeed, yspeed;
  float next_x, next_y;

  Ball() {
    x = mouseX;
    y = mouseY;
    xspeed = 0; 
    yspeed = 0;
  }
  
  void setNext(float x_, float y_) {
    next_y = y_;
    next_x = x_;
  }
  
  void draw() {
    float ax = (next_x - x) * spring;
    xspeed += ax;
    xspeed *= friction;
    x += xspeed;
    
    float ay = (next_y - y) * spring;
    yspeed += ay;
    yspeed *= friction;
    y += yspeed;
    
    stroke(0);
    fill(0);
    ellipse(x, y, 8, 8);
  }
}

void setup() {
  size(640, 480);
  frameRate(30);
  
  for (int i = 0; i < 10; i++) {
    balls.add(new Ball());
  }
}

void draw() {
  background(255);
  
  balls.get(0).setNext(mouseX, mouseY);
  
  for (int i = 1; i < balls.size(); i++) {
    Ball b = balls.get(i);
    Ball previous_b = balls.get(i - 1);
     
    b.setNext   (previous_b.x, previous_b.y);
  }
  
  for (int i = 0; i < balls.size(); i++) {
    balls.get(i).draw();
  }
}