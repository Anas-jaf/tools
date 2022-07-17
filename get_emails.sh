#!/bin/bash
for i in {1..70}; do 
printf "\rplease wait 70/$i"; sleep 1 ;
done

curl 'https://mailtrap.io/api/v1/inboxes/1822118/messages' -H 'api-token: {API_TOKEN_HERE}'| jq | grep "subject"