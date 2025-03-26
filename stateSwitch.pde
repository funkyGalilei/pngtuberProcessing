
void stateSwitch() {
      
    if (keyPressed) {
      state = true;
    } else if (key == 'b') {
      state = false;
    }
    
    if (state) {
          noStroke();

      fill(k, 255, 255);
                    rect(0, 0, width/4, height/4);

      //print("\n\n\n\n");
    } else {
            fill(k, 255, 255);
          rect(width/4, 0, width/4, height/4);

    }
}
