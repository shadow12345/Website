void setup() {
  // Set the size of the window
  size (500, 900);
}
void draw() {
  // Draw a white background
  background(255, 250, 25);
  
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode (CENTER);
  ellipse(20, 20, 40, 40);
 
 zoog(100, 100);
 zoog(400, 400);
 zoog(mouseX, mouseY);
 zoog(mouseX-50, mouseY-50);
}

void zoog(int xpos,int ypos) {
   // Draw Zoog's body
  stroke(0);
  fill(150);
  rect(xpos, ypos, 20, 100);
  
  //Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(xpos, ypos-50, 60, 60);
  
  //Draw Zoog's eyes
  fill(0);
  ellipse(xpos-20, ypos-50, 16, 32);
  ellipse(xpos+20, ypos-50, 16, 32);
  
  //Draw Zoog's legs
  stroke(0);
  line(xpos-10, ypos+50, xpos-20, ypos+70);
  line(xpos+10, ypos+50, xpos+20, ypos+70);
  
  stroke(0);
  line(xpos-20, ypos-40, xpos+25, ypos-40);
  line(xpos-20, ypos-60, xpos-60, ypos-100);
  line(xpos+20, ypos-60, xpos+60, ypos-100);
  
}

