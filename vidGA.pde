//Kim Ash
//Nature of Code/Computational Cameras Final 2012
//Evolving Video - genetic algorithm rearranges image pixels

import processing.video.*;
Capture feed;

MateBox mb[][] = new MateBox[16][12];
int boxSide = 40;

void setup()
{
  size(640, 480);
  rectMode(CORNER);

  feed = new Capture(this, 640, 480);
  feed.start();
  
  for (int i=0; i < 16; i++){
     for (int j=0; j < 12; j++){
       mb[i][j] = new MateBox (i*boxSide, j*boxSide);
     } 
  }
}

void draw()
{
  if (feed.available() == true) {
    feed.read();
  }
  
  image(feed, 0, 0, width, height);
  
  for (int i=0; i < 16; i++){
     for (int j=0; j < 12; j++){
       mb[i][j].display();
       mb[i][j].crossover();
     } 
  }
}
