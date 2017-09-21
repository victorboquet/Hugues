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
int SoundFroidSelector;

SoundFile froid1;
SoundFile froid2;
SoundFile froid3;
SoundFile cestmieu1;
SoundFile cestmieu2;
SoundFile cestmieu3;
SoundFile plusfroid1;
SoundFile plusfroid2;
SoundFile plusfroid3;
SoundFile cestlepied1;
SoundFile cestlepied2;
SoundFile cestlepied3;


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

  //SoundFile for Hugues's Voice
  
  //froid
  froid1 = new SoundFile(this, "froid1.wav");
  froid2 = new SoundFile(this, "froid2.wav");
  froid3 = new SoundFile(this, "froid3.wav");
  //cestmieu
  cestmieu1 = new SoundFile(this, "cestmieu1.wav");
  cestmieu2 = new SoundFile(this, "cestmieu2.wav");
  cestmieu3 = new SoundFile(this, "cestmieu3.wav");
  //plusfroid
  plusfroid1 = new SoundFile(this, "plusfroid1.wav");
  plusfroid2 = new SoundFile(this, "plusfroid2.wav");
  plusfroid3 = new SoundFile(this, "plusfroid3.wav");
  //cestlepied
  cestlepied1 = new SoundFile(this, "cestlepied1.wav");
  cestlepied2 = new SoundFile(this, "cestlepied2.wav");
  cestlepied3 = new SoundFile(this, "cestlepied3.wav");

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


// Osc receive : Wekinator HUG classifier. 

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
  
  random(1,3);
  // Play random sound like this algorythm : 
  SoundFroidSelector = int(random(1,3));
  if(SoundFroidSelector == 1)froid1.play();
  if(SoundFroidSelector == 2)froid2.play();
  if(SoundFroidSelector == 3)froid3.play();
}

void cestmieu() {
  image(cestmieu, 10, height / 2 - froid.height / 2);
  cestmieu1.play();
  cestmieu2.play();
  cestmieu3.play();
}

void plusfroid() {
  image(plusfroid, 10, height / 2 - froid.height / 2);
  plusfroid1.play();
  plusfroid2.play();
  plusfroid3.play();
}

void cestlepied() {
  image(cestlepied, 10, height / 2 - froid.height / 2);
  cestlepied1.play();
  cestlepied2.play();
  cestlepied3.play();
}