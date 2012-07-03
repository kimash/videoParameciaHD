//© Kim Ash 2012
class MateBox
{
  public PImage section;

  int boxSide = 80;  //720p => 80, 1080p => 120
  int x, y;

  boolean once = false;

  MateBox (int x_, int y_)
  {
    x = x_;
    y = y_;
    section = createImage(boxSide, boxSide, RGB);
  }

  void grabVideo()
  {
    if (!once) {
      section = feed.get(x, y, boxSide, boxSide);
      once = true;
    }
  }

  void display()
  {
    //stroke(255, 255, 0);
    noStroke();
    noFill();
    tint(255,40);
    image(section, x, y);
    rect(x, y, boxSide, boxSide);
  }

  void conjugate(MateBox partner)  //paramecium-style conjugation
  {
    PImage store = createImage(boxSide, boxSide, RGB);
    //storage for pixel trade between mb and partner
    section.loadPixels();
    partner.section.loadPixels();
    store.loadPixels();

    int crossover = int(random(section.pixels.length));
    for (int i=0; i < section.pixels.length; i++)
    {
      if (i < crossover) {
        store.pixels[i] = section.pixels[i];
        partner.section.pixels[i] = store.pixels[i];
      }
      else {
        store.pixels[i] = partner.section.pixels[i];
        section.pixels[i] = store.pixels[i];
      }
    }
    section.updatePixels();
    partner.section.updatePixels();
  }

  void mutate(float m)
  {
    if (random(1) < m) {
      once = false; 
    }
  }
}

