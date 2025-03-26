import processing.sound.*;

AudioIn input;
Amplitude amp;
Amplitude liveAmp;

SoundFile file;

String outputFolder = "newFolder/";

int numFrames = 96;
PImage[] images = new PImage[numFrames];

int supNumFrames = 240;
PImage[] supportingImages = new PImage[supNumFrames];

PImage staticImage;


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

      staticImage = load1Image("folder", staticImage);
      images = loadImages("visor", numFrames, images);
      supportingImages = loadImages("billowingCloak", 240, supportingImages);
}

//  ITERATORS
int j = 0; // used to index
int i = 1; // tells time
int k = 1; // used by the visualizer
int l = 1; // used to loop thru supporting images

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
  addImages(motion, amplitude, supportingImages[l]);
  addImages(motion, amplitude, staticImage);
  ampAnalyzer = liveAmp.analyze();

  float modifiedAudio = audioFilter(ampAnalyzer);
  
  i++;
  
     if (l == supNumFrames-1) {
     l = 0; 
    }
    else {
      l++;
    }
  
  j = int(round(map(modifiedAudio, 0, 1, 10, numFrames)));
    //j = int(round(map(arrayAmp[i], 0, 1, 0, numFrames)));

  //ampVisualizer = int(round(map(ampAnalyzer, 0, numFrames, 0, height)));
     
    j = numFrames - j; // to invert
    
    image(images[(j)], 0, motion + amplitude, width, height);

    //visualize();
    diagnostics();

}
