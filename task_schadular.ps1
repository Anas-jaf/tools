# $action = New-ScheduledTaskAction -Execute 'notepad.exe'
# $trigger = New-ScheduledTaskTrigger -Daily -At 6am -RepetitionDuration  (New-TimeSpan -Minutes 1)  -RepetitionInterval  (New-TimeSpan -Minutes 1)
# Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath "MyTasks" -TaskName "testTask1" -Description "This task opens the Notepad editor"

#  to Unregister task 
# Unregister-ScheduledTask -TaskName "TASK-NAME" -Confirm:$false



# #check if there is ssh connection 
# netstat | findstr :22
    # $Trigger= New-ScheduledTaskTrigger -AtStartup
    # $User= "NT AUTHORITY\SYSTEM"
    # $Action= New-ScheduledTaskAction -Execute "start-process" -Argument 'PowerShell.exe "echo "this is test file"; pause"'
    # Register-ScheduledTask -TaskName "MonitorGroupMembership" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest -Force

start-process PowerShell.exe -arg '& $Env:Programfiles\Oracle\VirtualBox\VBoxManage.exe startvm desktop-ib79771 --type headless'  -WindowStyle Hidden


cmd.exe /c start /min cmd /c "%Programfiles%\Oracle\VirtualBox\VBoxManage.exe" startvm desktop-ib79771 --type headless