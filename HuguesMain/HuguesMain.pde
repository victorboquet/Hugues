import gifAnimation.*;
import oscP5.*;
import netP5.*;
import processing.serial.*;
import processing.sound.*;

Gif froid;
Gif cestmieu;
Gif plusfroid;
Gif cestlepied;
String portName = Serial.list()[3];
String emotion = "";
Serial port;
int capteur;
float sensors[];
float selector = 0;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  
  // Gifs
  froid = new Gif(this, "froid.gif");
  froid.loop();
  cestmieu = new Gif(this, "cestmieu.gif");
  cestmieu.loop();
  plusfroid = new Gif(this, "plusfroid.gif");
  plusfroid.loop();
  cestlepied = new Gif(this, "cestlepied.gif");
  cestlepied.loop();
  //capteur = 0 ;
  
  //Program size
  size(512, 512);
  background(0);
  
  //Osc Send & Receive adress
  oscP5 = new OscP5(this, 12345);
  myRemoteLocation = new NetAddress("127.0.0.1", 6448);
  oscP5 = new OscP5(this, 1200);

  printArray(Serial.list());
  port=new Serial(this, portName, 9600);
  port.clear();
}

void draw() {


  //background(0);
  //capteur = 0;
  //Search bearConductive Card
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

      //Send Osc Messages to Wekinator
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

      if (selector == 1) {
        emotion = "froid"; //drums();
      } else if (selector == 2) {
        emotion = "cestmieu"; //bass();
      } else if (selector == 3) {
        emotion = "plufrois"; //guitar();
      } else if (selector == 4) {
        emotion = "cestlepied"; //synth();
      }
      if (keyPressed) {
        if (key == 'a' || key == 'A') {
          emotion = "froid"; //drums();
          //boucheCounter = 0;
          //drumsSound.play();
          //drumsSound.amp(0.05);
          //drumsSound.rate(0.5);
        }
        if (key == 'z' || key == 'Z') {
          emotion = "cestmieu"; //bass();
          //boucheCounter = 0;
          //bassSound.play();
          //bassSound.rate(0.5);
          //bassSound.amp(0.05);
        }
        if (key == 'e' || key == 'E') {
          emotion = "plusfroid"; //guitar();
          //boucheCounter = 0;
        }

        if (key == 'r' || key == 'R') {
          emotion = "cestlepied"; //synth();
          //boucheCounter = 0;
          //synthSound.play();
          //synthSound.rate(0.5);
          //synthSound.amp(0.05);
        }
        if (emotion == "froid") froid();
        else if (emotion == "cestmieu") cestmieu();
        else if (emotion == "plusfroid") plusfroid();
        else if (emotion == "cestlepied") cestlepied();
      }
    }
  }// !!!! faire attention aux parenthèse !!!
}


// Osc receive : Wekinator Hug classifier. 

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    if (theOscMessage.checkTypetag("f")) {
      float f = theOscMessage.get(0).floatValue();
      println("received1");
      println((int)f);
    }
  }
}

// Faces and Sounds for each emotion. 

void froid() {
  image(froid, 10, height / 2 - froid.height / 2);
}

void cestmieu() {
  image(cestmieu, 10, height / 2 - froid.height / 2);
}

void plusfroid() {
  image(plusfroid, 10, height / 2 - froid.height / 2);
}

void cestlepied() {
  image(cestlepied, 10, height / 2 - froid.height / 2);
}