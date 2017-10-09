import processing.video.*;
 
Capture cam;
color colors[];

PImage photo;
PImage my_image;
int division = 40;


int scale_x, scale_y;

color[][] target_colors = new color[division][division];

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480, "FaceTime HD Camera");
  my_image = createImage(640, 480, RGB);

  photo = createImage(640, 480, RGB);

  scale_x = photo.width / division;
  scale_y = photo.height / division;

  loadPixels();
  cam.start();
}
 
void draw() {
  if (cam.available()) {
    cam.read();
 
    for (int i = 0; i < cam.height; i ++) {
      for (int j = 0; j < cam.width; j ++) {
        int loc = i * width + j;
        
        color color_ = cam.pixels[loc];
 
        my_image.pixels[i * cam.width + j] = color_;
      }
    }
    my_image.updatePixels();


    for (int i = 0; i< division; i++) {
      for (int j = 0; j< division; j++) {
        target_colors[j][i] = my_image.get(j * scale_x, i * scale_y);
      }
    }

    fill(255);
    rect(0,0, width, height);

    for (int i = 0; i < division; i++) {
      for (int j = 0; j< division; j++) {
        fill(target_colors[j][i]);
        noStroke();

        pushMatrix();
          rect(0, 0, 10, 10);
        popMatrix();

        translate(10, 0);
        if (j == division - 1) {
          translate(-(division * 10), 0);
        }
      }
      translate(0, 10);
    }
  }
}
