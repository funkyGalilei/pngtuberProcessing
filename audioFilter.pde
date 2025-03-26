
// accept audioSource from .analyze, so a normalized float, then 
// returns a modified wave that is still mapped from 0 to 1

// values tuned to the Yeti mic!

 float audioFilter(float audioSource){

// now maybe BOOSTING the noise values to make it more smooth 
  // just adding
  //if (ampAnalyzer < .09 && ampAnalyzer > .03) {
  //  ampAnalyzer = ampAnalyzer + .5;
  //}
  // BOOSTING WITH MAPPING
  // map doesn't clamp values unfortunately, so
  
  //modAmpAnalyzer = map(ampAnalyzer, 0, micSensitivity, 0, 1);
 
 //// LOW NOISE FILTER
 //if (modAmpAnalyzer < micSupressionLow) {
 //  modAmpAnalyzer = 0;
 //}
 
 //// HIGH NOISE FILTER
 //if (modAmpAnalyzer < micSupressionHigh) {
 //  modAmpAnalyzer = 0.6;
 //}
  
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
    
    float modifiedAudio = audioSource;
    return  modifiedAudio;
    
}
