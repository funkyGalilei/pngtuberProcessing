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

int frameScan = 50;
float[] arrayAmp = new float[frameScan];
float[] mouseInput = new float[frameScan];

void setup() {
    size(270*2, 400*2);
    frameRate(24);
    noSmooth();

    liveAmp = new Amplitude(this);
    input = new AudioIn(this, 0);
    input.start();
    
    liveAmp = new Amplitude(this);
    liveAmp.input(input);
  
  
  // LOADING IMAGES ==============================
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

//  ITERATORS
int j = 0; // used to index
int i = 1; // tells time
int k = 1; // used by the visualizer
int l = 1; // used to loop thru supporting images
int m = 1; // secondary

float ampAnalyzer = 0;
float ampVisualizer;
float motion = 0;

float micSupressionLow = 0.16;
float micSupressionHigh = 0.9;
float micSensitivity = 1;

int amplitude = height/20;

void draw() {
  colorMode(RGB, 255);
  background(0, 255, 0);
  noCursor();
  
  someMotion(i, amplitude);
  addImages(motion, amplitude);
  
  ampAnalyzer = liveAmp.analyze();

  float modifiedAudio = audioFilter(ampAnalyzer);
  
  i++;
  
  j = int(round(map(ampAnalyzer, 0, 1, 10, numFrames)));
    //j = int(round(map(arrayAmp[i], 0, 1, 0, numFrames)));

  //ampVisualizer = int(round(map(ampAnalyzer, 0, numFrames, 0, height)));
     
    j = numFrames - j; // to invert
    
    image(images[(j)], 0, motion + amplitude, width, height);

    visualize();
    diagnostics();

}
