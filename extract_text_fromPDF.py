from tika import parser # pip install tika

raw = parser.from_file('اللغة العربية - الصف الثاني عشر-1.pdf')
content = raw['content']

content = str(content)
content= content.encode('utf-8')
filtered= content.hex().replace('efbfbd' , '')
print(type(filtered))
binary_str = codecs.decode(filtered, "hex")
filtered_string = str(binary_str,'utf-8')

with open('12.txt','w', encoding="utf8") as f:
    f.write(filtered_string)
