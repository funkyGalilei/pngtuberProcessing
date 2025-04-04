import processing.sound.*;

// ChildApplet child;
boolean mousePressedOnParent = false;

// TABLET MAPPING
float tabX;
float tabY;
int mainHeight = 400;
int mainWidth = 270;
int setHeight = 400;
int setWidth = 400;
//int childHeight = 700;
//int childWidth = 600;
int childHeight = 1080;
int childWidth = 1920;
int padding = 50;

AudioIn input;
Amplitude amp;
Amplitude liveAmp;

SoundFile file;

String outputFolder = "output/";

// images ==================================================== //
int numFrames = 96;
PImage[] images = new PImage[numFrames];

int supNumFrames = 239;
PImage[] supportingImages = new PImage[supNumFrames];

PImage staticImage;
PImage tabletImg;
PImage handImg;
boolean loadingDone = false;

int frameScan = 50;
float[] arrayAmp = new float[frameScan];
float[] mouseInput = new float[frameScan];

boolean state;

void setup() {
    size(400, 400);
    
    frameRate(24);
    noSmooth();

    windowTitle("Main sketch");
    //child = new ChildApplet();

    liveAmp = new Amplitude(this);
    input = new AudioIn(this, 0);
    input.start();
    
    liveAmp = new Amplitude(this);
    liveAmp.input(input);
    
  // LOADING IMAGES ==============================

      staticImage = loadImage("static/base head.png");
      tabletImg = loadImage("static/knight tablet.png");
      handImg = loadImage("static/knight hand.png");
      images = loadImages("visor", numFrames, images);
      supportingImages = loadImages("billowingCloak", supNumFrames, supportingImages);
}

//  ITERATORS
int j = 1; // used to index
int i = 1; // tells time
int k = 1; // used by the visualizer
int l = 1; // used to loop thru supporting images

// AUDIO WAVE CHANGER
float ampAnalyzer = 0;
float ampVisualizer;
float motion = 0;
float modifiedAudio = 0;

int amplitude = height/20;

void draw() {
  colorMode(RGB, 255);
  background(255, 0, 255);
  noCursor();
  loadingDone = true;
  
  stateSwitch();
  
  someMotion(i, amplitude);
  
  addImages(motion, amplitude, supportingImages[l]); //should b l
  addImages(motion, amplitude, staticImage);
  
  ampAnalyzer = liveAmp.analyze();

  modifiedAudio = audioFilter(ampAnalyzer);
  
  i++;
  
  if (state) {
    j = int(round(map(modifiedAudio, 0, 1, 48, numFrames)));
    //j = int(round(map(arrayAmp[i], 0, 1, 0, numFrames)));
  } else {
        j = int(round(map(modifiedAudio, 0, 1, 1, numFrames)));
  }
  //ampVisualizer = int(round(map(ampAnalyzer, 0, numFrames, 0, height)));
     
    j = numFrames - j; // to invert
    
    // this is just for the visor! there was an error during loading the other images, 
    // mainly because j would run out before getting stabilized by an audio output
    if (loadingDone) {
      image(images[(j-1)], 0, motion + amplitude, mainWidth, mainHeight);
    }
//if (mousePressed) {
//    fill(0);
//    text("Mouse pressed on parent.", 10, 10);
//    fill(0, 240, 0);
//    ellipse(mouseX, mouseY, 60, 60);
//    mousePressedOnParent = true;
//  } else {
//    fill(20);
//    //ellipse(width/2, height/2, 60, 60);
//    mousePressedOnParent = false;
//  }
//  //box(100);
//  if (child.mousePressed) {
//    text("Mouse pressed on child.", 10, 30);
//  }
    //tablet();
    //image(tabletImg, width/15, height * 2/3, 390, height/2);  
    visualize();
    diagnostics();
    
   // saveFrame(outputFolder + "####.png");
}
