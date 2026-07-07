#include <SoftwareSerial.h>
#include <DFRobotDFPlayerMini.h>

SoftwareSerial dfSerial(16, 10);   // RX, TX
DFRobotDFPlayerMini player;

const int buttonPin = 2;

// Number of MP3 files on the SD card
const int TOTAL_TRACKS = 3;

bool lastButtonState = HIGH;

void setup()
{
  Serial.begin(115200);

  pinMode(buttonPin, INPUT_PULLUP);

  dfSerial.begin(9600);

  if (!player.begin(dfSerial))
  {
    Serial.println("DFPlayer initialization failed!");
    while (1);
  }

  player.volume(25);

  // Seed the random number generator
  randomSeed(analogRead(A0));

  Serial.println("Ready");
}

void loop()
{
  bool buttonState = digitalRead(buttonPin);

  // Button pressed
  if (lastButtonState == HIGH && buttonState == LOW)
  {
    int track = random(1, TOTAL_TRACKS + 1);

    Serial.print("Playing track ");
    Serial.println(track);

    player.play(track);

    delay(300);   // Debounce
  }

  lastButtonState = buttonState;
}