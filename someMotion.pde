

// going to pass the total number of seconds we want the curve to be, and then also the i, or time in frames

void someMotion (float sinTime, int amplitude){
  
  float angularVelocity = 0.05;
  
  sinTime = sinTime * angularVelocity;
  
  motion = sin(sinTime) * amplitude;
}
