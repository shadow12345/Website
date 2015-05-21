Car [] myCars = new Car[100];

void setup() {
size(500, 500);
background(255);
frameRate(20);
// intantiate the array of cars
for (int i = 0; i< myCars.length; i++) {
  myCars[i]= new Car(random(width),random(height),int(random(100)),color(random(255),random(255),random(255)),random(10));
 }
}
void draw() {
  background(255);

//draw cars
for(int i = 0; i < myCars.length; i++) {
  Car iCar = myCars[i];
  iCar.display();
  iCar.drive();
  }
}
class Car{
  // member variable
  int cLength, cHeight, cWeight, cSpeed;
  float xpos, ypos;
  color cColor;
  float left;
  // constructor1
  Car(float tempx, float tempy){
  xpos = tempx;
  ypos = tempy;
  cWeight = 100;
  cSpeed = 5;
  cColor = color(255,0,0);
  }

  //constructor2
  Car(float tempx, float tempy, int tempSpeed, int tempColor, float templeft){
   xpos = tempx;
   ypos = tempy;
  cSpeed = tempSpeed;
  cColor = tempColor;
  left = templeft;
  }
  
  //member methods 
  void display () {
  rectMode(CENTER);
  fill(cColor);
  rect(xpos, ypos, 20, 10);
  rect(xpos-8,ypos+7,7,4);
  rect(xpos-8,ypos-7,7,4);
  rect(xpos+8,ypos+7,7,4);
  rect(xpos+8,ypos-7,7,4);
  }
  
  void drive () {
    if(left<=5) {
  xpos = xpos + cSpeed;
  if (xpos > width) {
  xpos = 0;
  }
  } else{
  xpos = xpos -cSpeed;
  if (xpos < 0 ) {
    xpos = width;
  }
 }   
}
  }

  

