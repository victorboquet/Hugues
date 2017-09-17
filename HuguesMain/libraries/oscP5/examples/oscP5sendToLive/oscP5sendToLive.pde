/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
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
  oscP5 = new OscP5(this,12345);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("192.168.43.170",12000);
  MidiBus.list();
  myBus = new MidiBus(this, "Bus 1", "Bus 1"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}


void draw() {
  background(0);  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  String s = theOscMessage.get(0).stringValue();
  //println(s);
  String[] tmp = s.split("/");
  float x = float(tmp[0]);
  float y = float(tmp[1]);
  float z = float(tmp[2]);
  float rotateX = map(int(x), -180, 180, 0, 128);
  float rotateY = map(int(y), -180, 180, 0, 128);
  float rotateZ = map(int(z), -180, 180, 0, 128);
  
fill(255);
myBus.sendControllerChange(0, 0, int(rotateX));
myBus.sendControllerChange(0, 1, int(rotateY));
myBus.sendControllerChange(0, 2, int(rotateZ));

  println(int(rotateX), int(rotateY), int(rotateZ) ); 
}