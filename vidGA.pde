//Kim Ash
//Nature of Code/Computational Cameras Final 2012
//Evolving Video - genetic algorithm rearranges image pixels

import processing.video.*;
Capture feed;

MateBox mb[][] = new MateBox[16][12];
int boxSide = 40;

ArrayList<MateBox> matingPool;
int generations;

void setup()
{
  size(640, 480);
  rectMode(CORNER);

  feed = new Capture(this, 640, 480);
  feed.start();
  
  matingPool = new ArrayList<MateBox>();
  
  for (int i=0; i < 16; i++){
     for (int j=0; j < 12; j++){
       mb[i][j] = new MateBox (i*boxSide, j*boxSide);
       matingPool.add(mb[i][j]);
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
     } 
  }
}

void reproduction()
 {
   //if (frameCount % 5 == 0) 
   for (int i = 0; i < matingPool.size(); i++)
   {
     int m = int(random(matingPool.size()));
     int d = int(random(matingPool.size()));
     
     MateBox mom = matingPool.get(m);
     MateBox dad = matingPool.get(d);
     MateBox offspring = mom.crossover(dad);
     
     //method to select mb to replace
     //mb[x][y] = offspring;
   }
 }
