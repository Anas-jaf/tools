Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# wsl --install
# kali

Enable-WindowsOptionalFeature -Online -FeatureName microsoft-windows-subsystem-linux
iwr -Uri https://aka.ms/wsl-kali-linux-new -OutFile  Kali.appx -UseBasicParsing
Add-AppxPackage .\Kali.appx

kali
sudo wget https://archive.kali.org/archive-key.asc -O /etc/apt/trusted.gpg.d/kali-archive-keyring.asc
--2022-07-15 09:42:39--  https://archive.kali.org/archive-key.asc

sudo dpkg -i kali-archive-keyring_2022.1_all.deb
apt update
apt install libcrypt1
apt full-upgrade
apt autoremove

##### incase gpg error try this 
# chmod 777 /tmp
# apt update

#  incase this error happend 
##########################
# Sorry, try again.
# Sorry, try again.
# sudo: 3 incorrect password attempts
##########################
# wsl -u root passwd <username>
##########################
# if it doesn't fix it try these commands 
########
# wsl --export kali-linux snapshot.tar
# wsl -u root rm /etc/sudoers
# wsl -u root apt install --reinstall -o Dpkg::Options::="--force-confask,confnew,confmiss" sudo


#    incase libc-bin error try to fix with these commands 
#######################
# cd /tmp
# apt -y download libcrypt1
# dpkg-deb -x libcrypt1_1%3a4.4.27-1.1_amd64.deb .
# cp -av lib/x86_64-linux-gnu/* /lib/x86_64-linux-gnu/
# apt -y --fix-broken install
###################### or this 
# sudo mv /var/lib/dpkg/info /var/lib/dpkg/info_old
# sudo mkdir /var/lib/dpkg/info
# sudo apt-get update && sudo apt-get -f install
# sudo mv /var/lib/dpkg/info/* /var/lib/dpkg/info_old
# sudo rm -rf /var/lib/dpkg/info　
# sudo mv /var/lib/dpkg/info_old /var/lib/dpkg/info
