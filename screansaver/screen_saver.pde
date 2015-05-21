
Lines[] myLines = new Lines [10];

void setup() {
  background(random(2, 50));
  frameRate(300);
  size(900, 500);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 5), random(1, 20));
  }
}
void draw() {
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }
  if (frameCount == 2500) {
    frameCount = 0;
    background(random(2, 50));
  } else {
    for (int i=0; i<myLines.length; i++) {
      Lines iLines = myLines[i];
      iLines.display();
    }
  }
}
class Lines {
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;

  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }

  void display() {
    strokeW = random(1, 2);
    lineLength = random(1, 50);
    stroke(random(255), random(255), random(255));
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>90) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (random(100)>90) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else if (random(100)>90) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else if (random(100)>90) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      }//else if (random(100)>90) {
//        strokeWeight(strokeW);
//        moveUpLeft(xpos, ypos, lineLength);
//      }
    }
  }
  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+1, startY);
      xpos = startX +i;
      ypos = startY;
    }
  }
  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-1, startY);
      xpos = startX -i;
      ypos = startY;
    }
  }
  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-1);
      xpos = startX;
      ypos = startY-i;
    }
  }
  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+1);
      xpos = startX;
      ypos = startY+i;
    }
//  }void moveUpLeft(float startX, float startY, float moveCount) {
//    for (float i=0; i<moveCount; i++) {
//      point(startX, startY+1);
//      xpos = startX-i;
//      ypos = startY+i;
//    }
  }
}

