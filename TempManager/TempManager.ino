//TMP36 Pin Variables
int sensorPin0 = 0;
int sensorPin1 = 1;
int sensorPin2 = 2;
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
  //VALUES
 int reading0 = analogRead(sensorPin0);
 int reading1 = analogRead(sensorPin1);
 int reading2 = analogRead(sensorPin2);    

 //voltage
 float voltage0 = reading0 * 5.0;
 voltage0 /= 1024.0; 

  float voltage1 = reading1 * 5.0;
 voltage1 /= 1024.0; 

  float voltage2 = reading2 * 5.0;
 voltage2 /= 1024.0; 

 //Conversion
 float temperature0 = (voltage0 - 0.5) * 100 ; 
 float temperature1 = (voltage1 - 0.5) * 100 ; 
 float temperature2 = (voltage2 - 0.5) * 100 ;
 //Print
 Serial.print("0 : ");Serial.print(temperature0); Serial.println(" C");


  Serial.print("1 : "); Serial.print(temperature1); Serial.println(" C");
 

   Serial.print("2 : "); Serial.print(temperature2); Serial.println(" C");
delay(1000);

                               
}
