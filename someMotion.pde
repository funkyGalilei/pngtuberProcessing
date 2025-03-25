

// going to pass the total number of seconds we want the curve to be, and then also the i, or time in frames

void someMotion (float sinTime) {
  
  float angularVelocity = 0.1;
  
  sinTime = sinTime * angularVelocity;
  
  int amplitude = 20;
  motion = sin(sinTime) * amplitude;
}
