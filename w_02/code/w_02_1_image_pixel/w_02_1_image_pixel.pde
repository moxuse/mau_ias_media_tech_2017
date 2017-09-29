PImage photo;

color[][] target_colors = new color[40][40];

void setup() {
  size(480, 420);
  photo = loadImage("tape.jpg");
  
  int scale_x = photo.width / 40;
  int scale_y = photo.height / 40;
  
  for (int i = 0; i< 40; i++) {
    for (int j = 0; j< 40; j++) {
      target_colors[j][i] = photo.get(j * scale_x, i * scale_y);
    }
  }
}

void draw() {
   fill(255);
   rect(0,0, width, height);
  
   for (int i = 0; i < 40; i++) {
     for (int j = 0; j< 40; j++) {
       fill(target_colors[j][i]);
       noStroke();
      
       pushMatrix();
       rect(0, 0, 10, 10);
       popMatrix();
      
       translate(10, 0);
       if (j == 39) {
         translate(-400, 0);
       }
     }
     translate(0, 10);
   }
   image(photo, 10, 400 );  
}