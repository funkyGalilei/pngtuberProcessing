
// display and by default the a and b parameters define the location of its upper-left corner.
void addImages(float yPosition, int offset, PImage imageShowing) {
  
 //tint(50);
 //tint(255);

  if (l < 237) {
    l = l +1;
  } else {
    //print("secondary reset");
    l = 2;
  }

  float endYLocation = yPosition + offset;
  //endYLocation = 200;
    
    // mainWidth and mainHeight have preserved aspect ratio with reference from static png
    image(imageShowing, 0, endYLocation, mainWidth, mainHeight); // can add width and height back in here
}
