
void tablet() {
  // remember, the values of child and main might not match up because vars can't be passed to size()
  // additionally, the pixels are counting from the top left, not the bottom
  //tabX = map(tabX, 0, childWidth, 0, mainWidth);
  //tabY = map(tabY, 0, childHeight, 0, mainHeight);
  
  //tabX = map(tabX, 0, childWidth, 0 + padding, mainWidth - padding);
  //tabY = map(tabY, 0, childHeight, mainHeight*2/3, mainHeight);

  tabX = map(tabX, 0, childWidth, 100, 290);
  tabY = map(tabY, 0, childHeight, 320, 380);
  //image(handImg, tabX + 100, tabY + 100, 100, 100);
  
    imageMode(CENTER);
  image(handImg, tabX, tabY, 125, 150);
  imageMode(CORNER);
  
    ellipse(tabX, tabY, 20, 20);

  
}

class ChildApplet extends PApplet {
    
  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
    public void settings() {
    size(600, 700);
  }
   public void setup() { 
    windowTitle("Child sketch");
  }
  
    public void draw() {
    background(0);

    if (mousePressed) {
      fill(240, 0, 0);
      ellipse(mouseX, mouseY, 20, 20);
      fill(255);
      text("Mouse pressed on child.", 10, 30);
             tabX = mouseX;
      tabY = mouseY;
   
    } else {
      fill(255);
      //ellipse(width/2, height/2, 20, 20);
      ellipse(mouseX, mouseY, 20, 20);  
             tabX = mouseX;
      tabY = mouseY;
    }
   

    //box(100, 200, 100);
    if (mousePressedOnParent) {
      fill(255);
      text("Mouse pressed on parent", 20, 20);
    }
  }
  
}
