//instantiate each of the classification of buttons
Button[] numButton = new Button[10];
Button[] opButton = new Button[11];
Button[] spButton = new Button[1];

//Global variables
String displayValue = "0";
String valueToCompute = "";
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float result = 0;
char opValue;
boolean firstNum;
void setup() {
  size(160, 190);
  numButton[0] = new Button(10, 70).asNumber(0, 20, 110);
  numButton[1] = new Button(40, 130).asNumber(1, 20, 20);
  numButton[2] = new Button(70, 130).asNumber(2, 20, 20);
  numButton[3] = new Button(100, 130).asNumber(3, 20, 20);
  numButton[4] = new Button(40, 100).asNumber(4, 20, 20);
  numButton[5] = new Button(70, 100).asNumber(5, 20, 20);
  numButton[6] = new Button(100, 100).asNumber(6, 20, 20);
  numButton[7] = new Button(40, 70).asNumber(7, 20, 20);
  numButton[8] = new Button(70, 70).asNumber(8, 20, 20);
  numButton[9] = new Button(100, 70).asNumber(9, 20, 20);
  opButton[0] = new Button(130, 160).asOperator("+", 20, 20);
  opButton[1] = new Button(130, 130).asOperator("-", 20, 20);
  opButton[2] = new Button(130, 100).asOperator("*", 20, 20);
  opButton[3] = new Button(130, 70).asOperator("÷", 20, 20);
  opButton[4] = new Button(40, 160).asOperator("C", 20, 20);
  opButton[5] = new Button(10, 40).asOperator("±", 20, 20);
  opButton[6] = new Button(100, 160).asOperator("=", 20, 20);
  opButton[7] = new Button(40, 40).asOperator("√", 20, 20);
  opButton[8] = new Button(70, 40).asOperator("^2", 20, 20);
  opButton[9] = new Button(100, 40).asOperator("si", 20, 20);
  opButton[10] = new Button(130, 40).asOperator("co", 20, 20);
  spButton[0] = new Button(70, 160).asSpecial(".", 20, 20);
  firstNum = true;
}

void draw() {
  for (int i=0; i<numButton.length; i++) {
    Button inumButton = numButton[i];
    inumButton.display();
  }
  updateDisplay();
  for (int i=0; i<opButton.length; i++) {
    Button iopButton = opButton[i];
    iopButton.display();
  }
  for (int i=0; i<spButton.length; i++) {
    Button ispButton = spButton[i];
    ispButton.display();
  }
}


void performCalculation() {
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == 's') {
    if (firstNum) {
      valueToComputeI = sqrt(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2;
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == 'r') {
    if (firstNum) {
      valueToComputeI = sq(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2;
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == 'i') {
    if (firstNum) {
      valueToComputeI = sin(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2;
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == 'o') {
    if (firstNum) {
      valueToComputeI = cos(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2;
      displayValue = str(valueToComputeI2);
    }
  }
}

//  if (firstNum) {
//    valueToCompute = displayValue;
//  } else {
//    valueToCompute = displayValue;
//    valueToCompute = "";
//  }else if (opValue == 'n') {
//  if (firstNum) {
//    valueToComputeI = valueToComputeI*-1;
//    displayValue = str(valueToComputeI);
//  } else {
//    valueToComputeI2 = valueToComputeI2*-1;
//    displayValue = str(valueToComputeI);
//  }
// }


void updateDisplay() {
  fill(200, 200, 150);
  rect(10, 10, 140, 20, 20);
  fill(0);
  textSize(10);
  text(displayValue, 20, 29);
}

void mousePressed() {
  for (int i=0; i<numButton.length; i++) {
    Button inumButton = numButton[i];
    inumButton.click();
    if (inumButton.on) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }

  for (int i=0; i<opButton.length; i++) {
    Button iOpButton = opButton[i];
    iOpButton.click();
    if (iOpButton.on) {
      if (iOpButton.opButtonValue == "+") {
        if (result != 0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "-") {
        if (result != 0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "*") {
        if (result != 0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      } else if (iOpButton.opButtonValue == "÷") {
        if (result != 0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue ='C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI = 0;
        result =0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == "±") {
        opValue = 'n';
        performCalculation();
      } else if (iOpButton.opButtonValue == "√") {
        opValue = 's';
        performCalculation();
      } else if (iOpButton.opButtonValue == "^2") {
        opValue = 'r';
        performCalculation();
      } else if (iOpButton.opButtonValue == "si") {
        opValue = 'i';
        performCalculation();
      } else if (iOpButton.opButtonValue == "co") {
        opValue = 'o';
        performCalculation();
      }
    }
  }


  for (int i=0; i<spButton.length; i++) {
    Button iSpButton = spButton[i];
    iSpButton.click();
    if (iSpButton.on) {
      if (iSpButton.spButtonValue == ".") {
        if (iSpButton.on && firstNum == true) {
          valueToCompute += iSpButton.spButtonValue;
          displayValue = valueToCompute;
        } else if (iSpButton.on && firstNum == false) {
          valueToCompute2 += iSpButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}

void keyPressed() {
  if (key == '1'){
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  }
}

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  }
}
class Button {
  //Class variables
  boolean isNumber;
  boolean isOperator;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float x;
  float y;
  float w;
  float h;
  boolean on;
  //constructor
  Button(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  Button asNumber(float tempNumButtonValue, float tempW, float tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    w=tempW;
    h = tempH;
    return this;
  }
  Button asOperator(String tempOpButtonValue, float tempW, float tempH) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    w=tempW;
    h = tempH;
    return this;
  }
  Button asSpecial(String tempSpButtonValue, float tempW, float tempH) {
    isSpecial = true;
    spButtonValue = tempSpButtonValue;
    w=tempW;
    h = tempH;
    return this;
  }
  //member methods
  void display() {
    if (isNumber) {
      fill(177);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h);
      fill(122, 44, 22);
      textSize(10);
      text(int(numButtonValue), x+5, y+15);
    } else if(isOperator) {
      fill(177);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h);
      fill(122, 44, 22);
      textSize(10);
      text(opButtonValue, x+5, y+15);
    } else if(isSpecial) {
      fill(177);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h);
      fill(122, 44, 22);
      textSize(10);
      text(spButtonValue, x+5, y+15);
    } 
    else {
      fill(177);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h);
      fill(122, 44, 22);
      textSize(10);
      text(spButtonValue, x+10, y+15);
      }
    }
    //rectMode(CORNER);
    //if (on) {
    // fill (175);
    // } else {
    // fill(0);
    // }
    // rect(x, y, w, h);
    // }
    void click() {
      on = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
      // if (mx>x && mx < x + w && my > y && my < y + h) {
      // on = !on;
    }
}

