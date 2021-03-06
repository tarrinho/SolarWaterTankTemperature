# SolarWaterTankTemperature
Get information from a Temperature Sensor to an Arduino and presented to an ELK (ElasticSearch Stack) - PT4.Tech - https://pt4.tech/blog/watersolartanktempmonitor/

*Goal: Retrieve water temperature from my solar tank and inject the data into my ELK Stack

Hardware: 
 - Arduino - ESP8266 (compatible) but in reality is: NodeMCU CP2102  
 
  ![CP2102](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/CP2102-ESP8266Compatible.PNG) 
  
 Where to buy: -> I bought mine from Aliexpress.
 
 - Temperature Sensor - DS18B20
 
 ![DS18D20](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/sonda-de-temperatura-submersivel-55%C2%BA-125%C2%BA.jpg) 
 
 Where to buy:
 https://www.tecnis.pt/compra/sonda-de-temperatura-submersivel-55%C2%BA-125%C2%BA-vdc3-5-5-ds18b20-para-4394
 

*Step 1: Get the electronic diagram 

![Electronic Diagram](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/ElectronicDiagram.PNG)

and mount your one version of it:

![First version](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/assembled.v1.jpg)

*Step 2: Get the Arduino code

I created a Webserver that will show the temperature from the sensor. There is bug that sometimes the output of the sensor gives 85 degrees or -127 degrees. For this reason I've added an extra validation before showing the result.

![Wifi Web Server Water Sensor Arduino code](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/WifiWebServerWaterSensor.ino)

*Step 3: Make it work

As soon as you start it it will create a web server that is connected to your network and add a static page with the current temperature.
![Web Server Printscreen](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/Webserver.printscreen.PNG)

Serial testing it:

![Working](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/Arduino.Serial.Temperature.PNG)

*Step 4: Because it is working, lets clean our hardware

Version 2 of our solution

![Second Version](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/assembled.v2.jpg)

Final Version of our solution - inside a platic protection (home made :D )

![Final Version](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/assembled.final.jpg)

*Step 5: Get it installed 

![Solution mounted](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/FinalInstalation-Mounted.jpg)


*Step 6: Get the data into a log/event file

Now that we have our webserver working, we need to get the data and every minute send it to our central ELK system. For that reason, I created this simple bash script that retrieves just the temperature and stores it in a event log file that will be consumed by our ELK.

https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/get.data.water.temp.sh


*Step 7: Add a new source from ELK

Now that we have the event/log file, we need to inject it to our ELK (ElasticSearch + Logstash + Kibana stack).

https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/logstash-watersolar.conf

*Step 8: Create a Dashboard

After ensuring the creating of the index, create a dashboard like this:

![Final Kibana Dashboard](https://github.com/tarrinho/SolarWaterTankTemperature/blob/master/Kibana.dashboard.PNG)

Final Note: 

I want to thank all the guys that detailed information on the Internet but specially to the ones that created the following sites, this allowed me to learn:

https://randomnerdtutorials.com/esp8266-ds18b20-temperature-sensor-web-server-with-arduino-ide/
https://www.circuitbasics.com/arduino-thermistor-temperature-sensor-tutorial/
