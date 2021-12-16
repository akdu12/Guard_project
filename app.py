from flask import Flask
from gevent.pywsgi import WSGIServer
from SensorManager import *


########################################################
# another way to run flask application go to cmd and write:
#1- cd webapp
#2- set FLASK_APP = app.py
#3- flask run
#4_ if you want to run it on the local network write: flask run  --host=0.0.0.0
# copy the link to the web browser and you ready to go :)
########################################################

# set-up Flask
app = Flask(__name__)


@app.route('/') # mean root file 
def index():
    return "Hello, I am raspberry pi :)"

@app.route('/t') # Get temperature reading 
def getTemperatureToFlask():
    temperature = getTemperature()
    print(temperature)
    return ' Temperature: ' + temperature
    
@app.route('/p') # Get pressure reading 
def getPressureToFlask():
    pressure = getPressure()
    print(pressure)
    return ' Pressure: ' + pressure

@app.route('/h') # Get humidity reading 
def getHumidityToFlask():
    humidity = getHumidity()
    print(humidity)
    return ' Humidity: ' + humidity

@app.route('/g') # Get gas reading 
def getGasToFlask():
    gas = getGas()
    print (gas)
    return ' Gas: ' + gas

if __name__ == '__main__':
#      app.run(debug=True, host='0,0,0,0') # '0,0,0,0' accessible to any device on the same local network
    http_server = WSGIServer(('0.0.0.0', 5000), app)
    http_server.serve_forever()
