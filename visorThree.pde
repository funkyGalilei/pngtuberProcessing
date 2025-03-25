
import processing.sound.*;

AudioIn input;
Amplitude amp;
Amplitude liveAmp;

SoundFile file;

int numFrames = 48;
int supNumFrames = 240;
int secSupNumFrames = 130;
int currentFrame = 0;

String outputFolder = "newFolder/";

PImage[] images = new PImage[numFrames];
PImage staticImage;
PImage[] supportingImages = new PImage[supNumFrames];
PImage[] secondarySupportingImages = new PImage[secSupNumFrames];

float audioDuration;

int time2Scan = 50;
float[] arrayAmp = new float[time2Scan];

void setup() {
    size(270, 400);
    int rateOfFrames = 12;
    frameRate(rateOfFrames);
      noSmooth();

  liveAmp = new Amplitude(this);
  input = new AudioIn(this, 0);
  input.start();
  
  liveAmp = new Amplitude(this);
  liveAmp.input(input);
  
  staticImage = loadImage("static/base head.png");
  
  for (int i = 1; i < numFrames; i++) {
     String imageName = nf(i, 4) + ".png";
     images[i-1] = loadImage(imageName);
  }
    for (int i = 1; i <= supNumFrames; i++) {
      String imageName = "cloak2/" + nf(i, 4) + ".png";
     supportingImages[i-1] = loadImage(imageName);
  }
      for (int i = 1; i < secSupNumFrames; i++) {
      String imageName = "light/" + nf(i, 4) + ".png";
     secondarySupportingImages[i] = loadImage(imageName);
  }
  
}

int j = 0; // used to index
int i = 1; // tells time
int k = 1; // used by the visualizer
int l = 1; // used to loop thru supporting images
int m = 1; // secondary

String saveName;

float ampAnalyzer = 0;
float modAmpAnalyzer = 0;
float ampVisualizer;
float motion = 0;

float micSupressionLow = 0.16;
float micSupressionHigh = 0.9;
float micSensitivity = .2;

void draw() {
  colorMode(RGB, 255);
  background(0, 255, 0);
  noCursor();
  addImages();
  
  ampAnalyzer = liveAmp.analyze();
  
  
  // now maybe BOOSTING the noise values to make it more smooth 
  // just adding
  //if (ampAnalyzer < .09 && ampAnalyzer > .03) {
  //  ampAnalyzer = ampAnalyzer + .5;
  //}
  // BOOSTING WITH MAPPING
  // map doesn't clamp values unfortunately, so
  modAmpAnalyzer = map(ampAnalyzer, 0, micSensitivity, 0, 1);
 
 // LOW NOISE FILTER
 if (modAmpAnalyzer < micSupressionLow) {
   modAmpAnalyzer = 0;
 }
 
 // HIGH NOISE FILTER
 if (modAmpAnalyzer < micSupressionHigh) {
   modAmpAnalyzer = 0.6;
 }
 
  
  // DELAY - keeping that value for a set amount of time (with i)
  // if the past arrayAmp value is bigger 
  // make the new arrayAmp[i] value closer, lets say .05 lower than 
  // arrayAmp[i - 1]
  // also, if i = 0 then compare to i =timeScan-1
  
    //arrayAmp[i] = modAmpAnalyzer;
    
    //if (i == time2Scan - 1) {
    //  i = 0;
    //    if (arrayAmp[time2Scan-1] > (arrayAmp[i])) {
    //      arrayAmp[i] = arrayAmp[time2Scan-1] - .01;
    //                  i++;
    //    }
    //} else {
    //  i++;
    //    if (arrayAmp[i-1] > (arrayAmp[i])) {
    //    arrayAmp[i] = arrayAmp[i-1] - .01;
    //  }
    //}
    i++;
    
  someMotion(i);
  
  j = int(round(map(modAmpAnalyzer, 0, 1, 10, numFrames)));
    //j = int(round(map(arrayAmp[i], 0, 1, 0, numFrames)));

  //ampVisualizer = int(round(map(ampAnalyzer, 0, numFrames, 0, height)));
     
    j = numFrames - j; // to invert
    
    image(images[(j)], 0, 0);

    //saveName = outputFolder + nf(i, 4) + ".png";
    //images[(j)].save(saveName);

    visualize();
    
     print("amp analysis: " + ampAnalyzer +"\t");
     print("modified analysis: " + modAmpAnalyzer + "\t" );
     print("time: "+i +"\t" + "index: "+ j +"\t" + "movement: " + motion);
     print( "\n");
     //print(arrayAmp[i] + "\n");

}
