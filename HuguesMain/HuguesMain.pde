

// Ce soir, déclancher les images et le son par appui sur touche du clavier. 

int select;
int soundSelect;
import gifAnimation.*;
import oscP5.*;
import netP5.*;
import processing.serial.*;
import processing.sound.*;
boolean playerInit = false;
int soundDelay = 300; 

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
  //frameRate = 80;
  int select = 0;
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
  oscP5 = new OscP5(this, 12000);

  //SoundFile for Hugues's Voice

  //froid
  //minim = new Minim(this);
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
  port=new Serial(this, portName, 19200);
  port.clear();
}

void draw() {

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
      //Prévoir que 8 zones à détecter. 
      OscMessage myMessage = new OscMessage("/wek/inputs");
      myMessage.add(sensors[0]); //1
      myMessage.add(sensors[1]); //2
      myMessage.add(sensors[2]); //3
      myMessage.add(sensors[3]); //4
      myMessage.add(sensors[4]); //5
      myMessage.add(sensors[5]); //6
      myMessage.add(sensors[6]); //7
      myMessage.add(sensors[7]); //8

      oscP5.send(myMessage, myRemoteLocation);
    }
  }
}

// Osc receive : Wekinator HUG classifier. 

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    if (theOscMessage.checkTypetag("f")) {
      float f = theOscMessage.get(0).floatValue();
      println("received1");
      println((int)f);

      //froid -----------------------------------------------------

      soundSelect = int(random(1, 4));


      println(soundSelect);
      if ((int)f == 1 && soundSelect == 1) {
        image(froid, 10, height / 2 - froid.height / 2);//drums();
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          froid1.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      } else if ((int)f == 1 && soundSelect == 2) {
        image(froid, 10, height / 2 - froid.height / 2);//drums();
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          froid2.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      } else if ((int)f == 1 && soundSelect == 3) {
        image(froid, 10, height / 2 - froid.height / 2);//drums();
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          froid3.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      }



      //cestmieu -----------------------------------------------------
      if ((int)f == 2 && soundSelect == 1) {
        image(cestmieu, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == soundDelay) {
          cestmieu1.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      } else if ((int)f == 2 && soundSelect == 2 ) {
        image(cestmieu, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          cestmieu2.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      } else if ((int)f == 2 && soundSelect == 3 ) {
        image(cestmieu, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          cestmieu3.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      }
      //plusfroid -----------------------------------------------------
      if ((int)f == 3 && soundSelect == 1) {
        image(plusfroid, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          plusfroid1.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      } else if ((int)f == 3 && soundSelect == 2) {
        image(plusfroid, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          plusfroid2.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      } else if ((int)f == 3 && soundSelect == 3) {
        image(plusfroid, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          plusfroid3.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      }

      //cestlepied -----------------------------------------------------
      if ((int)f == 4 && soundSelect == 1) {
        image(cestlepied, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          cestlepied1.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      }  else if ((int)f == 4 && soundSelect == 2) {
        image(cestlepied, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          cestlepied2.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      }else if ((int)f == 4 && soundSelect == 3) {
        image(cestlepied, 10, height / 2 - froid.height / 2);
        select ++ ;
        println(select);
        if (select == int(random(soundDelay))) {
          cestlepied3.play();
        }
        if (select > 500) {
          select = 0 ;
        }
      }
      //wouhou
      //if ((int)f == 5) {
      //  image(cestlepied1, 10, height / 2 - froid.height / 2);
      //  select ++ ;
      //  println(select);
      //  if (select == 200) {
      //    cestlepied1.play();
      //  }
      //  if (select > 500) {
      //    select = 0 ;
      //  }
      //}
    }}}