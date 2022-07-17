#!/bin/bash

# To Start SSH automatically on boot
#     sudo systemctl enable ssh
#     sudo service ssh start
# TO REVERSE SSH TUNNEL 
#     ssh -R 43022:localhost:22 kali@192.168.1.105 -p 22






if [ -e apikey.txt ];then
    API_KEY=`cat apikey.txt`
else
    read -p "Please type your ngrok api : " API_KEY
    echo $API_KEY |sudo tee apikey.txt > /dev/null
fi
# if [ -e ngrok]

pip install ngrok-api --quiet
# to get the tunnel public url and port  
tunnels=`python3 -c "import ngrok;client=ngrok.Client('$API_KEY');[print(i) for i in client.tunnels.list() ]" | egrep 'public_url.*started_at'  --only-matching | cut -c 15-|rev|cut -c 15-|rev`
if [ -z $tunnels ];then 
    echo 'there is no tunnels now start one from the remote desktop'
    # REQUIRED_PKG="ngrok"
    # PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
    # echo Checking for $REQUIRED_PKG: $PKG_OK

    # if [ "" = "$PKG_OK" ]; then
    #     echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
    #     curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
    # fi

    # if [ -e ./ngrok ];then
    #     if [  -z $1 $2 ];then
    #         tmux new-session -d -s my_session \; send-keys "./ngrok tcp 22" Enter
    #     else
    #         tmux new-session -d -s my_session \; send-keys "./ngrok $1 $2" Enter
    #     fi
    # else 
    #     sudo wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
    #     if [[ ngrok-v* == *.tar ]];then
    #         sudo tar -xzf ngrok-v3-stable-linux-amd64.tar
    #     else
    #         sudo gunzip ngrok-v3-stable-linux-amd64.tgz
    #     fi
    #     sudo tar xsf ngrok-v3-stable-linux-amd64.tar
    #     sudo chmod +x ./ngrok
    #     read -p "Please type your ngrok auth token : " AUTH_KEY
    #     ./ngrok authtoken $AUTH_KEY
    #     if [  -z $1 $2 ];then
    #         tmux new-session -d -s my_session \; send-keys "./ngrok tcp 22" Enter
    #     else
    #         tmux new-session -d -s my_session \; send-keys "./ngrok $1 $2" Enter
    #     fi
    # fi
else 
    echo $tunnels
fi
# TODO
# add the feature to create anonymous ngrok account
# add support for arm architecture
# use apt check this source https://ngrok.com/download 
