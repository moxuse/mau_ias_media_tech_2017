import processing.video.*;

Capture cam;
PImage[] buffer_r;
PImage[] buffer_w;

int WIDTH = 640;
int HEIGHT = 480;

int NUM_FRAMES = 120;
int IMAGE_HEIGHT = HEIGHT / NUM_FRAMES;

int index_write = 0;

void setup(){
  frameRate(30);
  size(640, 480);
  cam = new Capture(this, WIDTH, HEIGHT);
  cam.start();
  buffer_w = new PImage[NUM_FRAMES];
  buffer_r = new PImage[NUM_FRAMES];
  for (int i = 0; i < NUM_FRAMES; i++) {
    buffer_r[i] = createImage(WIDTH, IMAGE_HEIGHT, RGB);
  }
}

void draw() {
  if(cam.available()) {
    cam.read();
    buffer_w[index_write] = cam.get();
    
    for (int i = 0; i < NUM_FRAMES; i++) {
      if(buffer_w[i] != null){
        buffer_r[i].copy(buffer_w[i], 0, i * IMAGE_HEIGHT, WIDTH, 3, 0, 0, WIDTH, IMAGE_HEIGHT);
      }
   
      image(buffer_r[i], 0 , i * IMAGE_HEIGHT);
    }
    
    index_write++;
    if(index_write >= NUM_FRAMES - 1){
      index_write = 0;
    }
  }       
}
