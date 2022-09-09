import time
from ppadb.client import Client as AdbClient


client = AdbClient(host="127.0.0.1", port=5037) # Default is "127.0.0.1" and 5037
devices = client.devices()

if len(devices) == 0:
    print('No devices')
    quit()

device = devices[0]

print(f'Connected to {device}')
for i in range(5):
    print(i+1)
    time.sleep(1)
    
#device.shell('input touchscreen tap 550 2100')
device.shell('input touchscreen tap 550 1850')

