import ddf.minim.*;
 
Minim minim;
AudioInput audio_in;
int graph_height = 100;
 
void setup()
{
  size(512, 200);
 
  minim = new Minim(this);
 
  audio_in = minim.getLineIn(Minim.STEREO, 512);
}


void draw()
{
  background(0);
  stroke(255);
 
  for(int i = 0; i < audio_in.bufferSize() - 1; i++)
  {
    point(i, 50 + audio_in.left.get(i) * graph_height);
    point(i, 150 + audio_in.right.get(i) * graph_height);
  }
}