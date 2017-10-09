PImage photo;
int division = 40;

color[][] target_colors = new color[division][division];

void setup() {
  size(640, 480);
  photo = loadImage("test.png");
  
  int scale_x = photo.width / division;
  int scale_y = photo.height / division;
  
  for (int i = 0; i< division; i++) {
    for (int j = 0; j< division; j++) {
      target_colors[j][i] = photo.get(j * scale_x, i * scale_y);
    }
  }
}

void draw() {
   fill(255);
   rect(0,0, width, height);
  
   for (int i = 0; i < division; i++) {
     for (int j = 0; j< division; j++) {
       color col = target_colors[j][i];
       fill(col);
       noStroke();
      
       pushMatrix();
       // scale(random(5), random(5));
         rect(0, 0, 10, 10);
       popMatrix();
      
       translate(10, 0);
       if (j == division - 1) {
         translate(-(10 * division), 0);
       }
     }
     translate(0, 10);
   }
}
