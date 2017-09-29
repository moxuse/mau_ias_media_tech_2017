float frameNum = 0;
float gravity = 0.96;

ArrayList<Ball> balls = new ArrayList<Ball>();

class Ball{
  float x, y;
  float xspeed, yspeed;
  float density = 0.2;
  Ball() {
    x = mouseX;
    y = mouseY;
    
    xspeed = random(10) - 5.0; 
    yspeed = random(0.2);
  }
  
  void draw() {
    
    y += yspeed;
    x += xspeed;
    yspeed +=  gravity;
    
    if (y >= height) {
      yspeed *= -0.8;
    }
    
    if (x < 0 || x > width) {
      xspeed *= -0.8;
    }
    
    stroke(0);
    fill(0);
    ellipse(x, y, 8, 8);
  }
}

void setup() {
  size(640, 480);
  frameRate(30);
}

void draw() {
  background(255);
  
  if (mousePressed) {
    balls.add(new Ball());
  }
  
   for (int i = 0; i < balls.size(); i++) {
     balls.get(i).draw();
   }

  frameNum++;
}