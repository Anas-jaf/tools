Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
wsl --install

kali

sudo wget https://archive.kali.org/archive-key.asc -O /etc/apt/trusted.gpg.d/kali-archive-keyring.asc
--2022-07-15 09:42:39--  https://archive.kali.org/archive-key.asc

sudo dpkg -i kali-archive-keyring_2022.1_all.deb
sudo apt update 
sudo apt full-upgrade