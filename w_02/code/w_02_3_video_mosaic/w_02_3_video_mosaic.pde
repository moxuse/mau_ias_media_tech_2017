import processing.video.*;
 
Capture cam;
color colors[];

PImage photo;

PImage my_image;

int scale_x, scale_y;

color[][] target_colors = new color[40][40];

int num_pixels = 640 * 480 * 3;  

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480, "FaceTime HD Camera");
  my_image = createImage(640, 480, RGB);

  photo = createImage(640, 480, RGB);

  scale_x = photo.width / 40;
  scale_y = photo.height / 40;

  loadPixels();
  cam.start();
}
 
void draw() {
  if (cam.available()) {
    cam.read();
 
    for (int i = 0; i < cam.height; i ++) {
      for (int j = 0; j < cam.width; j ++) {
        int loc = i * width + j;
        
        float r = red(cam.pixels[loc]);
        float g = green(cam.pixels[loc]);
        float b = blue(cam.pixels[loc]);
 
        my_image.pixels[i * cam.width + j] = color(r, g, b);
      }
    }
    my_image.updatePixels();


    for (int i = 0; i< 40; i++) {
      for (int j = 0; j< 40; j++) {
        target_colors[j][i] = my_image.get(j * scale_x, i * scale_y);
      }
    }

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
}