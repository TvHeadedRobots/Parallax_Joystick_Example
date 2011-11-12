//using 5v ARef as voltage source
//0v leg on pot must go to GND

#include <Potentiometer.h>

Potentiometer potentiometer = Potentiometer(2); //a Potentiometer at analog in 2
Potentiometer potentiometer2 = Potentiometer(3); //a Potentiometer at analog in 3

int yHigh = 1023; // Joystick Y top value. This value varies
int yLow = 30; // Joystick Y bottom value. This value varies
int yCenter = 515; // Joystick Y center position value. This value varies
int yRange = yHigh - yLow; // Range required for obtaining linear curve

int xHigh = 1007; // Joystick X right value. This value varies
int xLow = 7; // Joystick X left value. This value varies
int xCenter = 499; // Joystick X center position value. This value varies
int xRange = xHigh - yLow; // Range required for obtaining linear curve

float midiCalY = 127.0 / yRange; //Convert Joystick values to MIDI
float midiCalX = 127.0 / xRange; //Convert Joystick values to MIDI

int midiValY = 0;
int midiValX = 0;

int buttonPin = 2;
int buttonPress = 0;

void setup(){
  Serial.begin(9600);
  pinMode(buttonPin, INPUT);
  digitalWrite(buttonPin, LOW);
  Serial.println("Joystick Potentiometer example");
    Serial.println("Cut Ground?");
  delay(2000);
}

void loop(){
   
  Serial.print("Y-Axis potentiometer.getValue() ");
  Serial.println(potentiometer.getValue(),DEC);
  Serial.print("X-Axis potentiometer2.getValue() "); 
  Serial.println(potentiometer2.getValue(),DEC);

  Serial.println(midiCalY,DEC);
  Serial.println(midiCalX,DEC);
  Serial.println(yRange,DEC);
  Serial.println(xRange,DEC);
  
  Serial.print("Y-Axis MIDI Value ");
  midiValY = constrain(midiCalY * potentiometer.getValue(), 0, 127);
  Serial.println(midiValY,DEC);
  Serial.print("X-Axis MIDI Value ");
  midiValX = constrain(midiCalX * potentiometer.getValue(), 0, 127);
  Serial.println(midiValX,DEC);


  Serial.print("Y-Axis potentiometer.getSector() ");
  Serial.println(potentiometer.getSector(),DEC);
  Serial.print("X-Axis potentiometer2.getSector() ");  
  Serial.println(potentiometer2.getSector(),DEC);
  
  if (digitalRead(buttonPin) == HIGH) {
    Serial.println("Yes! The button works!");
  }
  
  Serial.println();
  delay(1000); //how often do we poll for data? (in ms)
}
