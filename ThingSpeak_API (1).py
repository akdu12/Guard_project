import urllib.request
import threading
from SensorManager import *

def ReadingsfromSensorManager():

    Temperature = sensor.data.temperature
    Pressure = sensor.data.pressure
    Humidity = sensor.data.humidity
    Gas = sensor.data.gas_resistance          

    my_sensor = "{},{},{},{}".format(Temperature, Pressure, Humidity, Gas)                

    return my_sensor
# Post sensor data  every 15 Seconds
def thingspeak_post():
    
    Temperature, Pressure, Humidity, Gas = ReadingsfromSensorManager().split(',')
    threading.Timer(15,thingspeak_post).start()
    
    URl='https://api.thingspeak.com/update?api_key='
    KEY='ZDCMXZ3NS1IOTLK0'
    HEADER='&field1={}&field2={}&field3={}&field4={}'.format(Temperature, Pressure, Humidity, Gas)
    NEW_URL=URl+KEY+HEADER
    

    print(NEW_URL)
    postedData= urllib.request.urlopen(NEW_URL)
    print(postedData)

# reads last reading from thingSpeak
def read_data_thingspeak():

    URL = 'https://api.thingspeak.com/channels/1557435/feeds.json?api_key=66NFE3FQZOVONHN1&results=1'
    print(URL)
    WebsiteData = urllib.request.urlopen(URL)
    print (WebsiteData.read())
    

if __name__ == '__main__':
#      thingspeak_post()
     read_data_thingspeak()