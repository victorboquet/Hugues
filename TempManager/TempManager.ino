#include <OSCBoards copy.h>
#include <OSCBoards.h>
#include <OSCBundle.h>
#include <OSCData.h>
#include <OSCMatch.h>
#include <OSCMessage.h>
#include <OSCTiming.h>
#include <SLIPEncodedSerial.h>
#include <SLIPEncodedUSBSerial.h>

//TMP36 Pin Variables
int sensorPin0 = 0;
int sensorPin1 = 1;
int sensorPin2 = 2;
//int sensorPin3 = 3; 
//int sensorPin4 = 4; 
//int sensorPin5 = 5;
//int sensorPin6 = 6;
//int sensorPin7 = 7;


//the analog pin the TMP36's Vout (sense) pin is connected to
                        //the resolution is 10 mV / degree centigrade with a
                        //500 mV offset to allow for negative temperatures
 
/*
 * setup() - this function runs once when you turn your Arduino on
 * We initialize the serial connection with the computer
 */
void setup()
{
  Serial.begin(9600);  //Start the serial connection with the computer
                       //to view the result open the serial monitor 
}
 
void loop()                     // run over and over again
{
  OSCMessage msg("wek/inputs");
  
  //VALUES
 int reading0 = analogRead(sensorPin0);
 int reading1 = analogRead(sensorPin1);
 int reading2 = analogRead(sensorPin2);  
 //int reading3 = analogRead(sensorPin3);
 //int reading4 = analogRead(sensorPin4);
 //int reading5 = analogRead(sensorPin5); 
 //int reading6 = analogRead(sensorPin6);
 //int reading7 = analogRead(sensorPin7);      

 //voltage
 float voltage0 = reading0;
 //voltage0 /= 1024.0; 
 Serial.println(voltage0); 
 msg.add(voltage0);

 float voltage1 = reading1;
 //voltage1 /= 1024.0; 
  Serial.println(voltage1);
  msg.add(voltage1);

 float voltage2 = reading2;
 voltage2 /= 1024.0; 
 Serial.println(reading2);
 msg.add(voltage2);

//float voltage3 = reading3 * 5.0;
//voltage3 /= 1024.0; 

//float voltage4 = reading4 * 5.0;
//voltage4 /= 1024.0;

//float voltage5 = reading5 * 5.0;
//voltage5 /= 1024.0;

//float voltage6 = reading6 * 5.0;
//voltage6 /= 1024.0;

//float voltage7 = reading7 * 5.0;
//voltage7 /= 1024.0;


 //Conversion
 //float temperature0 = (voltage0 - 0.5) * 100 ; 
// float temperature1 = (voltage1 - 0.5) * 100 ; 
// float temperature2 = (voltage2 - 0.5) * 100 ;
// float temperature3 = (voltage0 - 0.5) * 100 ; 
// float temperature4 = (voltage1 - 0.5) * 100 ; 
// float temperature5 = (voltage2 - 0.5) * 100 ;
 //float temperature6 = (voltage0 - 0.5) * 100 ; 
 //float temperature7 = (voltage1 - 0.5) * 100 ; 
 //Print
 
  //Serial.print("0 : ");Serial.print(temperature0); Serial.println(" C");
//  Serial.print("1 : "); Serial.print(temperature1); Serial.println(" C");
//  Serial.print("2 : "); Serial.print(temperature2); Serial.println(" C");
//  Serial.print("3 : ");Serial.print(temperature3); Serial.println(" C");
//  Serial.print("4 : "); Serial.print(temperature4); Serial.println(" C");
//  Serial.print("5 : "); Serial.print(temperature5); Serial.println(" C");
  //Serial.print("6 : "); Serial.print(temperature6); Serial.println(" C");
  //Serial.print("7 : "); Serial.print(temperature7); Serial.println(" C");

  delay(1000);
                              
}
