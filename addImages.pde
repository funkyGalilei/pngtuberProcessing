

void addImages () {
 //tint(50);
 //tint(255);
  
    if (l == supNumFrames-1) {
     l = 0; 
    }
    else {
      l++;
    }
    
     if (m >= secSupNumFrames-2) {
     m = 1; 
    }
    else {
      m++;
    }
  
    image(supportingImages[l], 0, 0, width, height);

    image(secondarySupportingImages[m], 0, 0, width, height);
  
  image(staticImage, 0, 0);
}
