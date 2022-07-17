$action = New-ScheduledTaskAction -Execute 'notepad.exe'
$trigger = New-ScheduledTaskTrigger -Daily -At 6am -RepetitionDuration  (New-TimeSpan -Minutes 1)  -RepetitionInterval  (New-TimeSpan -Minutes 1)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskPath "MyTasks" -TaskName "testTask1" -Description "This task opens the Notepad editor"

#  to Unregister task 
# Unregister-ScheduledTask -TaskName "TASK-NAME" -Confirm:$false



#check if there is ssh connection 
netstat | findstr :22

