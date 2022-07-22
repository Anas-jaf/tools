import sys
import re


# ip6="5835:9123:4567::a3a3"
ip6=str(sys.argv[1])
ip6without=re.sub(':','',ip6)
# print(ip6without)
port=re.sub('1234.*a.*','',ip6without)
print(port)