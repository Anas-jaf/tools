#!/bin/bash
output=$(curl -silent 'http://portal1.mutah.edu.jo/StudCard/faces/LoginPage?_adf.ctrl-state=705ltw20x_3'   -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'   -H 'Accept-Language: en-US,en;q=0.9'   -H $'Cookie: JSESSIONID=3fz1jL3W5Zlk6CDN0FgyhhNJz9kyRPqhD62qc3QC0nhtkZkvsHZn\u0021-1875794697'   -H 'Proxy-Connection: keep-alive'   -H 'Upgrade-Insecure-Requests: 1'   -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36'   --compressed   --insecure |grep -E "var windowMode|var serverWindowId|+= \"_afrLoop") | afrLoop=$(echo $output | grep -E "query.*" | cut -c23-| rev|cut -c4-|rev) 
afrWindow=$(echo $output | grep -E "var windowMode"|cut -c18-|rev|cut -c2-|rev) 
serverWindowId=$(echo $output | grep -E "var serverWindowId" |cut -c23-|rev|cut -c3-|rev)
# printf "$afrLoop\n$afrWindow\n$serverWindowId"

#phase2.sh command
output2=`curl -silent "http://portal1.mutah.edu.jo/StudCard/faces/LoginPage?_adf.ctrl-state=705ltw20x_3&$afrLoop&_afrWindowMode=$afrWindow&Adf-Window-Id=$serverWindowId"   -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'   -H 'Accept-Language: en-US,en;q=0.9'   -H $'Cookie: JSESSIONID=3fz1jL3W5Zlk6CDN0FgyhhNJz9kyRPqhD62qc3QC0nhtkZkvsHZn\u0021-1875794697'   -H 'Proxy-Connection: keep-alive'   -H 'Upgrade-Insecure-Requests: 1'   -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36'   --compressed   --insecure`

#phase3.sh command
echo $output2 | grep -E "_afrRedirect|adf.ctrl-state" |afrRedirect=`echo $output2 | grep -E "_afrRedirect|adf.ctrl-state" | grep -E _afrRedirect |cut -c10-|rev|cut -c61- | rev `|adfCtrl="_adf`echo $output2 | grep -E "_adf.ctrl"|sed --expression='s/document.*_adf//g'|rev|cut -c4- |rev`" ; echo "$afrRedirect\n$adfCtrl"
curl -silent "http://portal1.mutah.edu.jo/StudCard/faces/LoginPage?$adfCtrl&$afrRedirect"

#run the script with 
#curl -s "http://portal1.mutah.edu.jo`bash phase1.sh | grep Stud | cut -c28- | rev|cut -c4-|rev`"
