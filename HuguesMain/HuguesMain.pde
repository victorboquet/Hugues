import oscP5.*;
import netP5.*;
import processing.serial.*;

PImage triste, surpris, content, joyeux;

String portName = Serial.list()[3];
Serial port;
int capteur;
float sensors[];

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  //capteur = 0 ;
  triste = loadImage("01.jpg");
  surpris = loadImage("02.jpg");
  size(512, 512);
  background(0);
  oscP5 = new OscP5(this,12345);
  myRemoteLocation = new NetAddress("127.0.0.1",6448);
  oscP5 = new OscP5(this,1200);
  
  printArray(Serial.list());
  port=new Serial(this, portName, 9600);
  port.clear();
}

void draw() {
  
  
  background(0);
//capteur = 0;
  while (port.available() > 10) {
    String myString = port.readStringUntil('\n');
 if (myString != null) {
    myString = trim(myString);

    // split the string at the commas
    // and convert the sections into integers:
    float sensors[] = float(split(myString, ','));
    //Next, print out those three integers using a for() loop, like so:

    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
       //println("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
    //println();
    //print(sensors[1]);
    //print(",");
    //print(sensors[2]);
    //print(",");
    //print(sensors[3]);
    //print(",");
    //print(sensors[4]);
    //print(",");
    //print(sensors[5]);
    //print(",");
    //print(sensors[6]);
    //print(",");
    //print(sensors[7]);
    //print(",");
    //print(sensors[8]);
    //print(",");
    //print(sensors[9]);
    //print(",");
    //print(sensors[10]);
    //print(",");
    //print(sensors[11]);
    

 OscMessage myMessage = new OscMessage("/wek/inputs");
 myMessage.add(sensors[0]); //1
 myMessage.add(sensors[1]); //2
 myMessage.add(sensors[2]); //3
 myMessage.add(sensors[3]); //4
 myMessage.add(sensors[4]); //5
 myMessage.add(sensors[5]); //6
 myMessage.add(sensors[6]); //7
 myMessage.add(sensors[7]); //8
 myMessage.add(sensors[8]); //9
 myMessage.add(sensors[9]); //10
 myMessage.add(sensors[10]); //11
 myMessage.add(sensors[11]); //12
 //myMessage.add((float)capteur);
 oscP5.send(myMessage, myRemoteLocation);
  
    }
  }
}


//Expression en fonction des calins. 

void oscEvent(OscMessage theOscMessage) {
   if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    if(theOscMessage.checkTypetag("f")) {
      float f = theOscMessage.get(0).floatValue();
      println("received1");
       println((int)f);
    }
  }
}

void froid(){
}

void cestmieu(){
}

void plusfroid(){

}

void cestlepied(){
}