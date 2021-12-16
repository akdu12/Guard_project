#!/usr/bin/env python
import time 
from pyrebase import pyrebase
from SensorManager import *
from datetime import datetime


config = {
  "apiKey": "AIzaSyCqc_mKfuEhivguaieQ3xbFTeiuB3lZtxk",
  "authDomain": "guard-28a03.firebaseapp.com",
  "databaseURL": "https://guard-28a03-default-rtdb.firebaseio.com",
  "storageBucket": "guard-28a03.appspot.com"
}

firebase = pyrebase.initialize_app(config)
db = firebase.database()

def getReadingToAPI():
    
    temperature = str(getTemperature())
    pressure = str(getPressure())
    humidity = str(getHumidity())
    gas = str(getGas())
    lux = str(getlight())
    prox = str(getProximity())
    
    return temperature,pressure,humidity,gas, lux, prox


if __name__=="__main__":
    
    while True:
        temperature,pressure,humidity,gas, lux, prox = getReadingToAPI()
        now = datetime.now()

        if temperature == '-1' or lux =='-1' or pressure == '-1' or humidity == '-1' or gas == '-1' or prox == '-1':
            time.sleep(5)
            continue
        else:
            BME688_data = {"Temperature":temperature, "Pressure":pressure , "Humidity": humidity, "Gas":gas, "time":str(now)}     
            db.child("BME688").push(BME688_data)
            print(BME688_data)
            LTR_559_data={"light":lux , "Proximity":prox , "time":str(now) }
            db.child("LTR-559").push(LTR_559_data)
            print(LTR_559_data)
            time.sleep(5)
  


    
    



