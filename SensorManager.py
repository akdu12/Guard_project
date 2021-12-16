import bme680
from ltr559 import LTR559
# from lsm303d import LSM303D


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


def IsBME680_Connected():
    sensor1_is_connected = False
    try:
        sensor = bme680.BME680()
        sensor.set_humidity_oversample(bme680.OS_2X)
        sensor.set_pressure_oversample(bme680.OS_4X)
        sensor.set_temperature_oversample(bme680.OS_8X)
        sensor.set_filter(bme680.FILTER_SIZE_3)
        sensor.set_gas_status(bme680.ENABLE_GAS_MEAS)
        sensor.set_gas_heater_temperature(320)
        sensor.set_gas_heater_duration(150)
        sensor.select_gas_heater_profile(0)
        sensor1_is_connected = True
        print("sensor1 conncected");
    except:
        print("sensor1 not conncected");
        
    return sensor1_is_connected 

def IsLTR559_Connected():
    sensor2_is_connected = False
    try:
        ltr559 = LTR559()
        sensor2_is_connected = True
        print("sensor2 conncected");       
    except:
        print("sensor1 not conncected"); 
    return sensor2_is_connected

    
# Sensor 3
# lsm = LSM303D(0x1d) # Change to 0x1e if you have soldered the address jumper


# def getMagnetometer():
#    xyz = lsm.magnetometer()
#    magnetometer = '{:+06.2f} : {:+06.2f} : {:+06.2f}'.format(*xyz)
#    return magnetometer


# def getAaccelerometer():
#   xyz = lsm.accelerometer()
#   accelerometer ="{:+06.2f}g : {:+06.2f}g : {:+06.2f}g".format(*xyz)
#   return accelerometer


def getlight():
    IsConnected = IsLTR559_Connected()
    if(IsConnected):
        ltr559.update_sensor()
        lux = ltr559.get_lux()
    else:
        lux = -1 
    return lux

def getProximity():
    IsConnected = IsLTR559_Connected()
    if(IsConnected):
        ltr559.update_sensor()
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


            
            
    
       
