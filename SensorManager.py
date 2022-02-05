import bme680
from ltr559 import LTR559
from lsm303d import LSM303D
from bh1745 import BH1745
from as7262 import AS7262
from mics6814 import MICS6814
import logging


# Sensor 1
sensor = bme680.BME680()
sensor.set_humidity_oversample(bme680.OS_2X)
sensor.set_pressure_oversample(bme680.OS_4X)
sensor.set_temperature_oversample(bme680.OS_8X)
sensor.set_filter(bme680.FILTER_SIZE_3)
sensor.set_gas_status(bme680.ENABLE_GAS_MEAS)
sensor.set_gas_heater_temperature(320)
sensor.set_gas_heater_duration(150)
sensor.select_gas_heater_profile(0)

# Sensor 2
ltr559 = LTR559()

# Sensor 3
lsm = LSM303D(0x1d) # Change to 0x1e if you have soldered the address jumper

# Sensor 4 
bh1745 = BH1745()
bh1745.setup()
bh1745.set_leds(1)

# Sensor 5 
as7262 = AS7262()
as7262.set_gain(64)
as7262.set_integration_time(17.857)
as7262.set_measurement_mode(2)
as7262.set_illumination_led(1)

# Sensor 6
gas = MICS6814()


def IsBME680_Connected():
    sensor1_is_connected = False
    try:
        sensor = bme680.BME680()
        sensor1_is_connected = True
        print("sensor1 conncected")
    except:
        print("sensor1 not conncected")
        
    return sensor1_is_connected 

def IsLTR559_Connected():
    sensor2_is_connected = False
    try:
        ltr559 = LTR559()
        sensor2_is_connected = True
        print("sensor2 conncected")      
    except:
        print("sensor2 not conncected")
    return sensor2_is_connected

def IsLSM303D_Connected():
    sensor3_is_connected = False
    try:
        lsm = LSM303D(0x1d)
        sensor3_is_connected = True
        print("sensor3 conncected")       
    except:
        print("sensor3 not conncected")
    return sensor3_is_connected

def IsBH1745_Connected():
    sensor4_is_connected = False
    try:
        bh1745 = BH1745()
        sensor4_is_connected = True
        print("sensor4 conncected")       
    except:
        print("sensor4 not conncected") 
    return sensor4_is_connected

def IsAS7262_Connected():
    sensor5_is_connected = False
    try:
        as7262 = AS7262()
        sensor5_is_connected = True
        print("sensor5 conncected")       
    except:
        print("sensor5 not conncected") 
    return sensor5_is_connected

def IsMICS6814_Connected():
    sensor6_is_connected = False
    try:
        gas = MICS6814()
        sensor6_is_connected = True
        print("sensor6 conncected")       
    except:
        print("sensor6 not conncected") 
    return sensor6_is_connected

def getSpectrum():
    IsConnected = IsAS7262_Connected()

    if (IsConnected == True):
          values = as7262.get_calibrated_values()
          print("""Red:    {}
                   Orange: {}
                   Yellow: {}
                   Green:  {}
                   Blue:   {}
                   Violet: {}""".format(*values))
    else:
        values = '-1'

    return values 
    
def getColour():
    IsConnected = IsBH1745_Connected()

    if (IsConnected == True):
         r, g, b, c = bh1745.get_rgbc_raw()
         RGBC = '{:10.1f} {:10.1f} {:10.1f} {:10.1f}'.format(r, g, b, c)
    else:
        RGBC = '-1'

    return RGBC 

def getMagnetometer():
    IsConnected = IsLSM303D_Connected()

    if (IsConnected == True):
        xyz = lsm.magnetometer()
        magnetometer = '{:+06.2f} : {:+06.2f} : {:+06.2f}'.format(*xyz)     
    else:
        magnetometer = '-1'

    return magnetometer 

def getAaccelerometer():
    
    IsConnected = IsLSM303D_Connected()

    if (IsConnected == True):
        xyz = lsm.accelerometer()
        accelerometer ="{:+06.2f}g : {:+06.2f}g : {:+06.2f}g".format(*xyz)   
    else:
        accelerometer = '-1'

    return accelerometer 

def getlight():
    IsConnected = IsLTR559_Connected()
    if(IsConnected):
        #ltr559.update_sensor()
        lux = ltr559.get_lux()
    else:
        lux = -1 
    return lux

def getProximity():
    IsConnected = IsLTR559_Connected()
    if(IsConnected):
        #ltr559.update_sensor()
        prox = ltr559.get_proximity()
    else:
        prox = -1 
    return prox

def getTemperature():
    
    IsConnected = IsBME680_Connected()
    
    if (IsConnected == True):
        if sensor.get_sensor_data():
            Temperature = sensor.data.temperature
        else:
            Temperature = sensor.data.temperature
    else:
        Temperature = -1
    
    return Temperature

def getPressure():

    IsConnected = IsBME680_Connected()
    
    if (IsConnected == True):
        if sensor.get_sensor_data():
            Pressure = sensor.data.pressure
        else:
            Pressure = sensor.data.pressure
    else:
        Pressure = -1
        
    return Pressure
           
def getHumidity():

    IsConnected = IsBME680_Connected()
    
    if (IsConnected == True):
        if sensor.get_sensor_data():
            Humidity = sensor.data.humidity
        else:
            Humidity = sensor.data.humidity
    else:
        Humidity = -1 
        
    return Humidity
             
def getGas():

    IsConnected = IsBME680_Connected()
    
    if (IsConnected == True):
        if sensor.get_sensor_data():
            Gas = sensor.data.gas_resistance
        else:
            Gas = sensor.data.gas_resistance
    else:
        Gas = -1 
         
    return Gas


            
            
    
       
