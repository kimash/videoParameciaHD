class Population 
{
 ArrayList<MateBox> matingPool;
 int generations;
 
 Population(MateBox[int x][int y] mbpop)
 {
   matingPool = new ArrayList<MateBox>();
   generations = 0;
   mbx = x;
   mby = y;
 }
 
 void selection()
 {
   matingPool.clear();
   for (int i = 0; i < mbx; i++)
   {
     for (int j = 0; j < mby; j++)
     {
       matingPool.add(mbpop[i][j]);
     }
   }
 }
 
 void reproduction()
 {
   for (int i = 0; i < matingPool.size(); i++)
   {
     int m = int(random(matingPool.size()));
     int d = int(random(matingPool.size()));
     
     MateBox mom = matingPool.get(m);
     MateBox dad = matingPool.get(d);
     MateBox offspring = mom.crossover(dad);
   }
 }
 
}
