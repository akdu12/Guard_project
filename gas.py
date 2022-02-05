import time
from mics6814 import MICS6814
import logging

gas = MICS6814()

logging.basicConfig(
    format='%(asctime)s.%(msecs)03d %(levelname)-8s %(message)s',
    level=logging.INFO,
    datefmt='%Y-%m-%d %H:%M:%S')

print("""gas.py - Print readings from the MICS6814 Gas sensor.
Press Ctrl+C to exit!
""")

while True:
    readings = gas.read_all()
    logging.info(" | ".join(str(readings).splitlines()))
    time.sleep(5)
