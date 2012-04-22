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

  MateBox crossover (MateBox partner)  
  {
    PImage newSection = createImage(boxSide, boxSide, RGB);
    section.loadPixels();
    partner.section.loadPixels();
    newSection.loadPixels();

    int crossover = int(random(section.pixels.length));
    for (int i = 0; i < section.pixels.length; i++)
    {
      if (i > crossover)
      {
        newSection.pixels[i] = section.pixels[i];
      }
      else
      {
        newSection.pixels[i] = partner.section.pixels[i];
      }
    }
    
    newSection.updatePixels();
    MateBox offspring = new MateBox(newSection);
    return offspring; //must define location for offspring box
  }
  
  void conjugate(MateBox partner)  //paramecium-style conjugation
  {
    section.loadPixels();
    partner.section.loadPixels();
  }
    
 }

