useful links


https://github.com/deeponion/deeponion/blob/master/doc/setup-meek.md
https://gitlab.torproject.org/legacy/trac/-/wikis/doc/meek


check if tor is running with 

`curl --socks5 localhost:9050 --socks5-hostname localhost:9050 -s https://check.torproject.org/api/ip`


make ssh over tor you do these steps

1-put these two lines in /etc/tor/torrc 

`HiddenServiceDir /var/lib/tor/ssh`

`HiddenServicePort 22 127.0.0.1`

2-to get the onion url hostname

`cat /var/lib/tor/ssh/hostname `

3-then ssh using the onion url

`torsocks ssh USERNAME@HOSTNAME`