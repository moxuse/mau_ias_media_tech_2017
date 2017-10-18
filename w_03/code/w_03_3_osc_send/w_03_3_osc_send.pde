import oscP5.*;
import netP5.*;

OscP5 oscP5;

NetAddress remoteServer;

void setup() {
  size(640, 480);

  oscP5 = new OscP5(this, 5000);

  remoteServer = new NetAddress("127.0.0.1", 7400);
}

void draw() {
  background(255); 
}

void mousePressed(){
  OscMessage msg = new OscMessage("/max");
  
  msg.add("/01");
  
  float freq = mouseX; 
  msg.add(freq);
  
  oscP5.send(msg, remoteServer);
}