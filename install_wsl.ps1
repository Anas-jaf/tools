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
sudo apt update 
sudo apt full-upgrade