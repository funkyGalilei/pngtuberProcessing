
// display and by default the a and b parameters define the location of its upper-left corner.
void addImages(float yPosition, int offset, PImage imageShowing) {
  
 //tint(50);
 //tint(255);
  
 
    
  float endYLocation = yPosition + offset;
  //endYLocation = 200;
    
    image(imageShowing, 0, endYLocation, width, height);
}
