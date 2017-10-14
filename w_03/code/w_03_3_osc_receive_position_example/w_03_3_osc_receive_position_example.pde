import oscP5.*;
import netP5.*;

OscP5 oscP5;

NetAddress remoteServer;

ArrayList<Particle> part = new ArrayList<Particle>();

void setup() {
  size(640, 480);
  
  oscP5 = new OscP5(this, 5000);

  remoteServer = new NetAddress("127.0.0.1", 5001);
}

void draw() {
  background(255);
  
  for(int i = 0; i < part.size(); i++) {
    part.get(i).draw();
  }
}

void oscEvent(OscMessage msg) {

  if(msg.checkAddrPattern("/yPos")) {

    int value = msg.get(0).intValue(); 
    
    part.add(new Particle(0, value));
    
    println("message at /test", value + 120);
  }
}