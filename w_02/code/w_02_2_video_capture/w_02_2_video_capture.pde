import processing.video.*;


Capture cam;

void setup() {
  size(1280, 720);

  String[] cameras = Capture.list();
  
  for (int i = 0; i < cameras.length; i++) {
    println(cameras[i]);
  }
    
  cam = new Capture(this, 1280, 720, "FaceTime HD Camera");
  cam.start();           
}

void draw() {
  if (cam.available()) {
    cam.read();
  }
  image(cam, 0, 0);
}