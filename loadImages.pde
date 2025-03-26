
// load images with total frame input, and folder input, and whether or not its static
// return an image data type, and create the PImages in this tab to make it easier 

PImage load1Image (String folderName, PImage returnedImage) {

      //loadImage      
      PImage createdImage;

      createdImage = loadImage("static/base head.png");
      returnedImage = createdImage;
      folderName = folderName + "/";
      
      return returnedImage;
}

PImage[] loadImages (String folderName, int numFrames, PImage[] returnedImages) {
  
  PImage[] createdImages = new PImage[numFrames];
  
    for (int i = 1; i < numFrames; i++) {
       String imageName = folderName + "/" + nf(i, 4) + ".png";
       createdImages[i-1] = loadImage(imageName);
       print(folderName + (i - 1) +" loaded\n");
    }
  
  returnedImages = createdImages;
  return returnedImages;
}
