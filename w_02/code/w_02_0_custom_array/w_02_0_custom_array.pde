Module mods[] = new Module[40];

void setup() {
  size(620, 240);
  
  for(int i = 0; i<40; i++) {
    mods[i] = new Module(i * 10, 20);
  }
}


void draw() {
  for(int i = 0; i<40; i++) {
    mods[i].draw();
  }
}

class Module {
  float x, y;
  Module(float x_, float y_) {
    x = x_;
    y = y_;
  }
  void draw() {
    stroke(0);
    ellipse(x, y, 10, 10);
  }
}