void setup() {
  size(720, 1020);
  
  fill(0, 0, 0);
  size(400, 400);
}

void draw() {
  if(keyPressed){
    if (key == 'r') {
      fill(204, 102, 0);
    } 
    else if (key == 'g'){
      fill(50, 205, 50);
    }
    else if (key == 'b'){
      fill(100, 149, 237);
    }
    else if (key == ENTER){
      fill(0, 0, 0);
    }
    else if (key == 's'){
      size(400, 400);
    }
    else if (key == 'm'){
      strokeWeight(16);
    }
    else if (key == 'l'){
      strokeWeight(40);
    }
    else if(key == 'o'){
      ellipse(mouseX, mouseY, 80, 80);
    }
    else if(key == '0'){
      rect(mouseX, mouseY, 80, 80);
    }  
    else if (key == 'i'){
      line(120, 80, 340, 300);
    }
  }  
}
