class Particle {
  float x, y;
  Particle(float x_, float y_) {
    x = x_;
    y = y_;
  }
  void draw() {
    ellipse(x, y, 10, 10);
    x++;
    if (x > width) {
      
      part.remove(this);
      println("delete..", part.size());
    }
  }
}