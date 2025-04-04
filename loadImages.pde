
// load images with total frame input, and folder input, and whether or not its static
// return an image data type, and create the PImages in this tab to make it easier 

PImage[] loadImages (String folderName, int numFrames, PImage[] returnedImages) {
  
  PImage[] createdImages = new PImage[numFrames];
  
    for (int i = 0; i < numFrames; i++) {
       String imageName = folderName + "/" + nf(i+1, 4) + ".png";
       createdImages[i] = loadImage(imageName);
       print(folderName + i +" loaded\n");
    }
  
  returnedImages = createdImages;
  return returnedImages;
}
