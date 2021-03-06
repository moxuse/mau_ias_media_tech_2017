import oscP5.*;
import netP5.*;

OscP5 oscP5;

Boolean bang = false;

void setup() {
  size(640, 480);
  oscP5 = new OscP5(this, 5000);
}

void draw() {
  if(bang){
    fill(255, 255);
    bang = false;
  } else {
    fill(0, 20);
  }
  rect(0, 0, width, height);
}


void oscEvent(OscMessage msg) {
  if(msg.checkAddrPattern("/max")) {
    String addr = msg.get(0).stringValue();
    float value = msg.get(1).floatValue();
    
    if (addr.equals("/01")) {    
      if (1 <= value) {
        bang = true;
      };
      println("message at ::",addr, value);
    }
  }
}