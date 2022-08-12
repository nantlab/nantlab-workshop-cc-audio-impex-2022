import oscP5.*;
import netP5.*;
import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; //Import the MidiMessage classes http://java.sun.com/j2se/1.5.0/docs/api/javax/sound/midi/MidiMessage.html
import javax.sound.midi.SysexMessage;
import javax.sound.midi.ShortMessage;


OscP5 oscP5;
//NetAddress myRemoteLocation;
MidiBus myBus; // The MidiBus


void setup() {
  size(400, 400);
  frameRate(25);
  oscP5 = new OscP5(this, 8000);

  //myRemoteLocation = new NetAddress("127.0.0.1",12000);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
  myBus = new MidiBus(this, 0, 4);
}


void draw() {
  int channel = 0;
  int pitch = 64;
  int velocity = 127;
  background(0);
  //myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  //delay(200);
  //myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff
  //delay(100);
}

void oscEvent(OscMessage message) {
  if (message.checkAddrPattern("/popeye/tm/Class 1")==true) {
    if (message.checkTypetag("f")) {
      float confidence = message.get(0).floatValue();
      println("class 1 :"+confidence);
    }
  }
  if (message.checkAddrPattern("/popeye/tm/Class 2")==true) {
    if (message.checkTypetag("f")) {
      float confidence = message.get(0).floatValue();
      println("class 2 :"+confidence);
    }
  }
}
