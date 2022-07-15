
$api= "Bearer <put your api key here>"

$r = curl https://api.ngrok.com/tunnels -UseBasicParsing -Headers @{'User-Agent'='ngrok-api-python/0.0.0/3.10.5' ;'Ngrok-Version'='2';'authorization'= $api}
$release =ConvertFrom-Json $r.Content
$final = $release.tunnels.public_url -match "tcp://(.*):(\d{2,})"
$ip =[System.Net.DNS]::GetHostAddresses($Matches[1]).IPAddressToString
$port=$Matches[2]
echo $ip $port
#and you can ssh to your ip now with the tunnel ip and port
# on the remote machine
#   ssh -R 43022:localhost:22 kali@3.68.171.119 -p 16412
# on the local machine 
#  ssh user1@localhost -p 43022