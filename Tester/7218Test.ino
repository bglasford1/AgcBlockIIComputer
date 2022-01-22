#include <ICM7218.h>

// Configure the 10 OUTPUT pins used to interface with ICM7218: D0-D7, mode, write
ICM7218 myLED(2, 3, 4, 5, ICM7218::NO_PIN, ICM7218::NO_PIN, 
              ICM7218::NO_PIN, ICM7218::NO_PIN, 14, 15);

char convertBuffer[16];
char c;
int i,j;

void setup() 
{
  Serial.begin(9600);
}

void loop() 
{
  myLED.setMode(ICM7218::CODEB);
  myLED.print("01234567");
  delay(3000);
  myLED.print("12345678");
  delay(3000);
  myLED.print("23456789");
  delay(3000);
  myLED.print("33333333");
  delay(3000);
  myLED.print("44444444");
  delay(3000);
  myLED.print("55555555");
  delay(3000);
  myLED.print("66666666");
  delay(3000);
  myLED.print("77777777");
  delay(3000);
  myLED.print("88888888");
  delay(3000);
  myLED.print("99999999");
  delay(3000);
}
