
// i is time, and is already iterated in main

void mouseAddition (int i, int mouseVar) {
  if (mousePressed) {
    mouseVar = mouseVar + 20;
  int timeScanned = 50;

    if (i == timeScanned - 1) {
      i = 0;
        if (arrayAmp[timeScanned-1] > (arrayAmp[i])) {
          arrayAmp[i] = arrayAmp[timeScanned-1] - .05;
        }
    } else {
        if (arrayAmp[i-1] > (arrayAmp[i])) {
        arrayAmp[i] = arrayAmp[i-1] - .5;
      }
      
    }
  }
}
