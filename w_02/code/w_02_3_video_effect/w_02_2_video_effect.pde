import processing.video.*;

Capture cam;
color colors[];

PImage my_image; 

int num_pixels = 640 * 480 * 3;  

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480, "FaceTime HD Camera");
  my_image = createImage(640, 480, RGB);
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

        my_image.pixels[i * width + j] = color(r, g, b);
      }
    }
    my_image.updatePixels();

    tint(255, mouseX / (float)width * 255.0);

    image(my_image, 10, 10);
  }
}
