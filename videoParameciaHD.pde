//Kim Ash
//Nature of Code/Computational Cameras Final 2012
//Video Paramecia - algorithm based on paramecium conjugation alters image
//HD requires Processing 1.5.1

import processing.video.*;
Capture feed;

MateBox mb[][] = new MateBox[16][12];  //[horiz][vert]
int boxSide = 80;  //720p => 80, 1080p => 120
int horiz = 16;
int vert = 9;

ArrayList<MateBox> matingPool;

void setup()
{
  size (1280, 720);  //720p = (1280, 720), 1080p = (1920, 1080)
  rectMode(CORNER);
//frameRate (30);
  feed = new Capture(this, 1920, 1080); 
//  feed.start();
//  feed.settings();  //use for camera settings

  matingPool = new ArrayList<MateBox>();

  for (int i=0; i < horiz; i++) {
    for (int j=0; j < vert; j++) {
      mb[i][j] = new MateBox (i*boxSide, j*boxSide);
      matingPool.add(mb[i][j]);
    }
  }
}

void draw()
{
  println(frameRate);
  if (frameCount > 30) {

    if (feed.available() == true) {
      feed.read();
    }

    for (int i=0; i < horiz; i++) {
      for (int j=0; j < vert; j++) {
        mb[i][j].grabVideo();
        mb[i][j].mutate(0.01);
      }
    }

    reproduction();

    for (int i=0; i < horiz; i++) {
      for (int j=0; j < vert; j++) {
        mb[i][j].display();
      }
    }
  }
}

void reproduction()
{
  int m = int(random(matingPool.size()));
  
  int mateShift = int(pow(-1,int(random(1))));  //select mate from 2 nearest neighbors
  
  if (m == 0)
    mateShift = 1;
    
  if (m == matingPool.size()-1)
    mateShift = -1;
  
  int d = m + mateShift;

  MateBox mom = matingPool.get(m);
  MateBox dad = matingPool.get(d);

  mom.conjugate(dad);
}

