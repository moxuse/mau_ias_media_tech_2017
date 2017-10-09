import ddf.minim.*;

Minim minim;
AudioInput audio_in;

PFont font;
PShape text_shape;

float graph_height = 150;
 
void setup()
{
  size(340, 210);
 
  minim = new Minim(this);
 
  audio_in = minim.getLineIn(Minim.STEREO, 512);
   
  font = createFont("SourceCodePro-Regular.ttf", 120);
  
  text_shape = font.getShape('G', 1);
}


void draw()
{
  background(0);
  stroke(255);
 
  PShape dest_shape;
  
  dest_shape = createShape();
  
  translate(130, 130);
  dest_shape.beginShape();

  for (int i = 0; i < text_shape.getVertexCount() - 1; i++) {
    PVector v = text_shape.getVertex(i);
    PVector v_b = text_shape.getVertex(i + 1);
    
    float x_ = v.x;
    float y_ = v.y;
    
    float x_b = v_b.x;
    float y_b = v_b.y;
    
    float val = audio_in.left.get(i * 10) * graph_height;
    
    PVector base = new PVector(x_, y_);
    PVector next = new PVector(x_b, y_b);
    
    PVector dest = getNormal(base, next).mult(val).add(base);
  
    dest_shape.vertex(dest.x, dest.y);
  }
  
  dest_shape.endShape();
  
  shape(dest_shape);
}

PVector getNormal(PVector currentPoint, PVector nextPoint) {
  PVector vAB = nextPoint.copy().sub(currentPoint).normalize();
  PVector vAZ = new PVector(0, 0, 1);
  PVector normalVec = vAB.cross(vAZ);
  return normalVec;
}