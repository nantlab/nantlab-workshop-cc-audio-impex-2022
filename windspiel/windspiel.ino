#define PIN_FAN 2
#define NOTE_FAN 0

void onNoteOn(byte channel, byte note, byte velocity) {
  if(note != NOTE_FAN){
    return;
  }
  Serial.println("note on");
  analogWrite(PIN_FAN, map(velocity, 0, 127, 0, 255));
}
void onNoteOff(byte channel, byte note, byte velocity) {
    if(note != NOTE_FAN){
    return;
  }
  analogWrite(PIN_FAN, 0);
  Serial.println("note off");

}
void setup() {
  Serial.begin(115200);
  usbMIDI.setHandleNoteOff(onNoteOff);
  usbMIDI.setHandleNoteOn(onNoteOn);
}


void loop() {
  usbMIDI.read();
}
