ssh -R 43022:localhost:22 kali@192.168.1.105 -p 22

# -R : reverse tunnel flag
# 43022 : port to forward 
# localhost : forward to localhost or the same machine 
# 22 : the port to forward from 
# kali@192.168.1.105 :the username and the ip to ssh into  
# -p : port flag to connect to 
