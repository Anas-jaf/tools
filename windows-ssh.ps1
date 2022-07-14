Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#check if ssh client exist 
if ((Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.client*' | Select-Object state).state -notcontains 'Installed'){

echo 'downloading ssh client'
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
}else{
    echo 'found ssh clinet ....... skipping'
}

#check if ssh server exists
if ((Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH.server*' | Select-Object state).state -notcontains 'Installed' ){
echo 'downloading ssh server'
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
}else{
    echo 'found ssh server ....... skipping'
}

# create user1 with password for ssh to connect to 
$password = '01230123' | ConvertTo-SecureString -AsPlainText -Force
New-LocalUser -Name user1 -Password  $password

# Install the client and server features by running the following commands:

# dism /Online /Add-Capability /CapabilityName:OpenSSH.Client~~~~0.0.1.0
# dism /Online /Add-Capability /CapabilityName:OpenSSH.Server~~~~0.0.1.0

##############################################################
##### if ssh agent is not running execute those commands #####
##############################################################
# Get-Service ssh-agent 
# Get-Service ssh-agent | Select StartType
# Get-Service -Name ssh-agent | Set-Service -StartupType Manual

#############################################
###### fix for permission denied issue ######
#############################################

#### install the opensshutils and fix it's issue ###
# Install-Module -Force OpenSSHUtils

# # if upove command doesn't work try this command
# Install-Module -Name OpenSSHUtils -RequiredVersion 1.0.0.1 -SkipPublisherCheck -Scope CurrentUser

# #restart the machine
# Restart-Computer -Force

# Start the sshd service
echo 'starting the service'
Start-Service sshd

# OPTIONAL but recommended:
echo 'making the service run automaticly on the machine'
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
echo 'adding the service rule to the firewall'
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}

echo 'finished seccussfully'
pause