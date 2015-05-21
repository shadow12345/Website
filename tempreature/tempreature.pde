void setup () {}

void draw() {
float temp = tempConverter(50);
println(temp);
}

float tempConverter(float far) {
  float cel =(far-32) * (5.0/9.0);
  return cel;
}

