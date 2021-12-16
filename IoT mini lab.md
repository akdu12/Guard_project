# Guard_project
IoT security system that detects abnormalities in IoT devices

Hardware Setup:

1- Setup Raspberry Pi by downloading operating system on an SD card and inserting it in Raspberry Pi

2- Configure breakout garden

Breakout Garden doesn't require any software of its own, but each breakout we will need a Python library.

We used a handy script to get started:

Plug in all of our Breakout Garden-compatible breakouts Run wget https://github.com/pimoroni/breakout-garden/archive/master.zip to download software. Run unzip master.zip to unzip the software. Run cd breakout-garden-master to enter code folder. Run sudo ./install.sh

3- Sensor Configuration

BME680:

import bme680 import time

sensor = bme680.BME680()

sensor.set_humidity_oversample(bme680.OS_2X) sensor.set_pressure_oversample(bme680.OS_4X) sensor.set_temperature_oversample(bme680.OS_8X) sensor.set_filter(bme680.FILTER_SIZE_3)

sensor.set_gas_status(bme680.ENABLE_GAS_MEAS) sensor.set_gas_heater_temperature(320) sensor.set_gas_heater_duration(150) sensor.select_gas_heater_profile(0) while True: if sensor.get_sensor_data(): output = "{0:.2f} C,{1:.2f} hPa,{2:.2f} %RH".format(sensor.data.temperature, sensor.data.pressure, sensor.data.humidity)

    if sensor.data.heat_stable:
        print("{0},{1} Ohms".format(output, sensor.data.gas_resistance))

    else:
        print(output)

time.sleep(1)
LTR559:

import time from ltr559 import LTR559

ltr559 = LTR559()

try: while True: ltr559.update_sensor() lux = ltr559.get_lux() prox = ltr559.get_proximity()

    print("Lux: {:06.2f}, Proximity: {:04d}".format(lux, prox))

    time.sleep(0.05)
except KeyboardInterrupt: pass

4- Installing Pyrebase API to connect sensors to the database
sudo apt-get update sudo apt-get install python-dev wget https://bootstrap.pypa.io/get-pip.py sudo python get-pip OR sudo apt-get install python-pip (new Raspian versions) sudo pip install pyrebase

5- Installing Flask API for internal communication

sudo pip install flask mkdir FlaskTutorial cd FlaskTutorial touch app.py from flask import Flask import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM) # Sets up the RPi lib to use the Broadcom pin mappings # for the pin names. This corresponds to the pin names # given in most documentation of the Pi header GPIO.setwarnings(False) # Turn off warnings that may crop up if you have the # GPIO pins exported for use via command line GPIO.setup(2, GPIO.OUT) # Set GPIO2 as an output

app = Flask(name) # Create an instance of flask called "app"

@app.route("/") # This is our default handler, if no path is given def index(): return "hello"

Flask API can be found under "app.py" in the main branch
