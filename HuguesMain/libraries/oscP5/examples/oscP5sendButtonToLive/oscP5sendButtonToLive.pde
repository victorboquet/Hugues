/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
int geste; 
import oscP5.*;
import netP5.*;
import themidibus.*;
MidiBus             myBus;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,1200);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",6448);
  MidiBus.list();
  myBus = new MidiBus(this, "Bus 1", "Bus 1"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}


void draw() {
  background(0);  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  
  float s = theOscMessage.get(0).floatValue();
  //println(s);
  geste = int(s);
println(geste);
myBus.sendNoteOn(geste, geste, 128);
//myBus.sendNoteOff(geste, geste, 128);



  
}

