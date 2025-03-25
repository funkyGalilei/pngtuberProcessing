
void visualize () {
    ampVisualizer = int(round(map(j, 0, numFrames, 0, height)));
        
noStroke();
colorMode(HSB, 255);
    fill(j, 255, 255);
    circle(k, ampVisualizer, 30);
//width/2
    
    if (k == width) {
     k = 0; 
    }
    else {
      k++;
    }
}
