class MateBox
{
  PImage section;

  //int[] dna;

  int boxSide = 40;
  int x, y;

  MateBox (int x_, int y_)
  {
    x = x_;
    y = y_;
    section = new PImage(boxSide, boxSide);
    //dna = new int[boxSide*boxSide];
  }

  MateBox (PImage img) //alternate constructor for offspring
  {
    section = img;
    //dna = newdna;
  }

  void display()
  {
    stroke(255, 255, 0);
    noFill();
    section = get(x, y, boxSide, boxSide);
    image(section, x, y);
    rect(x, y, boxSide, boxSide);
  }

  MateBox crossover (MateBox partner)  //idea: paramecium-style conjugation
  {
    PImage newSection = createImage(boxSide, boxSide, RGB);
    section.loadPixels();
    partner.section.loadPixels();
    newSection.loadPixels();

    //int[] newdna = new int[dna.length];
    int crossover = int(random(section.pixels.length));
    for (int i = 0; i < section.pixels.length; i++)
    {
      if (i > crossover)
      {
        newSection.pixels[i] = section.pixels[i];
        //dna = section.pixels[];
        //dna[i];
        //section.updatePixels();
      }
      else
      {
        newSection.pixels[i] = partner.section.pixels[i];

        //        partner.section.loadPixels();
        //        partner.dna = section.pixels[];
        //        partner.dna[i];
        //        partner.section.updatePixels();
        //      }
      }
    }
    
    newSection.updatePixels();
    MateBox offspring = new MateBox(newSection);
    return offspring;
  }
    
    
 }

