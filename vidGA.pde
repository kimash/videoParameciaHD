//Kim Ash
//Nature of Code/Computational Cameras Final 2012
//Video Paramecia - algorithm based on paramecium conjugation alters image

import processing.video.*;
Capture feed;

MateBox mb[][] = new MateBox[16][12];
int boxSide = 40;

ArrayList<MateBox> matingPool;
//int generations;
//color mutation = color(random(255), random(255), random(255));

void setup()
{
  size(640, 480);
  rectMode(CORNER);

  feed = new Capture(this, 640, 480);
  feed.start();

  matingPool = new ArrayList<MateBox>();

  for (int i=0; i < 16; i++) {
    for (int j=0; j < 12; j++) {
      mb[i][j] = new MateBox (i*boxSide, j*boxSide);
      matingPool.add(mb[i][j]);
    }
  }
}

void draw()
{

  if (frameCount > 30) {

    //mutation = color(random(255), random(255), random(255));

    if (feed.available() == true) {
      feed.read();
    }

    //image(feed, 0, 0, width, height);

    for (int i=0; i < 16; i++) {
      for (int j=0; j < 12; j++) {
        mb[i][j].grabVideo();
        mb[i][j].mutate(0.01);
      }
    }

    reproduction();

    for (int i=0; i < 16; i++) {
      for (int j=0; j < 12; j++) {
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

