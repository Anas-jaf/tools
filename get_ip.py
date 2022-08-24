#!/usr/bin/python3

import socket
import sys
import re

with open(sys.argv[1],'r') as file:
	x = file.readlines()

for ip in x : 
	ip = ip.replace('\n','')
	ip = re.sub("HTTPS://|http.{0,10}://|:\d{1,5}.*|/.*",'', ip)
	try :
		print( ip ,'============>', socket.gethostbyname(ip))
	except :
		print(f'############## ERROR with #################\n###\t{ip}\t\t###\n###########################################')