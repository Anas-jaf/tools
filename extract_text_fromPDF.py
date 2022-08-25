from tika import parser # pip install tika
import sys, codecs
raw = parser.from_file(sys.argv[1])
content = raw['content']

content = str(content)
content= content.encode('utf-8')
filtered= content.hex().replace('efbfbd' , '')
print(type(filtered))
binary_str = codecs.decode(filtered, "hex")
print(filtered , str(binary_str,'utf-8'))
