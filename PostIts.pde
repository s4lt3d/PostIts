// Walter Gordy 2016
// Draw posts with the mouse. 

colorSpace cs;
color backgroundcolor = color(255,255,0);
CIELCH cielch;

float fadingHeight = 0;

void setup() {
  size(1280,720);
  cs = new colorSpace();
  cielch = cs.RGBtoCIELCH(backgroundcolor);
  frameRate(30);
  background(255);
  noStroke();
}

void draw() {
  
  if(mouseButton == LEFT)
    postIt(random(30) - 30 + mouseX, random(30) - 30 + mouseY);
    
  else if(mouseButton == RIGHT)
    background(255);
    
  else if(mouseButton == CENTER)
  {
    for(int i = 0; i < 100; i++)
      postIt(random(width + 60) - 60, random(60) - 60 + fadingHeight);
    fadingHeight -= 10;
    if(fadingHeight < 0)
      fadingHeight = height;
  }
  else {
    filter(BLUR, frameCount%2);
    fill(255,255,255,8);
    rect(0,0,width, height);
  }
}

// draws note with shadow
void postIt(float x, float y) {

  cielch.h += 21.1;
  pushMatrix();
 
  translate(x, y);
  rotate(random(0.2) - 0.1);
  fill(50, 50, 50, 50);
  rect(2, 5, 30, 30);
 
  fill(cs.CIELCHtoRGB(cielch));
  rect(0,0, 30, 30);
  popMatrix();
}