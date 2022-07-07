#!/bin/bash

if [ -e apikey.txt ];then
    API_KEY=`cat apikey.txt`
else
    read -p "Please type your ngrok api : " API_KEY
    echo $API_KEY |sudo tee apikey.txt > /dev/null
fi
# if [ -e ngrok]

# to get the tunnel public url and port  
tunnels=`python3 -c "import ngrok;client=ngrok.Client('$API_KEY');[print(i) for i in client.tunnels.list() ]" | egrep 'public_url.*started_at'  --only-matching | cut -c 15-|rev|cut -c 15-|rev`
if [ -z $tunnels ];then 
    if [ -e ngrok ];then
        ./ngrok $1 $2
    else 
        sudo wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
        sudo gunzip ngrok-v3-stable-linux-amd64.tgz
        sudo chmod +x ./ngrok
        read -p "Please type your ngrok auth token : " AUTH_KEY
        ./ngrok authtoken $AUTH_KEY
        ./ngrok $1 $2
    fi
else 
    echo $tunnels
fi
# TODO
# add the feature to create anonymous ngrok account