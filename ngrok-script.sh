#!/bin/bash

if [ -e apikey.txt];then
    API_KEY=`cat apikey.txt`
else
    read -p "Please type your ngrok api" API_KEY
    echo API_KEY > apikey.txt
fi

# to get the tunnel public url and port  
python3 -c "import ngrok;client=ngrok.Client('$API_KEY');[print(i) for i in client.tunnels.list() ]" | egrep 'public_url.*started_at'  --only-matching | cut -c 15-|rev|cut -c 15-|rev

# TODO
# add the feature to create anonymous ngrok account