PFont font;

void setup() {
  font = createFont("SourceCodePro-Regular.ttf", 120);
  size(640, 480);
}

void draw() {
  PShape textShape = font.getShape('F', 1);
  
  textShape.beginShape();
  textShape.strokeWeight(1);
  textShape.stroke(255);
  textShape.noFill();
  textShape.endShape();
  
  shape(textShape, 120, 120);

}