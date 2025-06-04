# Windows-Service-Monitoring-Extension
Easily track the status (Running, Stopped, Paused, etc.) of any Windows service.

This is a custom Windows service Extension for the AppDynamics Machine Agent. It collects various system metrics (Status of running Service  on windows os ) and reports them as custom metrics to AppDynamics.

  # installation  
git clone  WinSvcMonitoring  under  Monitors Directory  in  machineagent  that is  running 

# 2 choice  upon your request 
1- If you need to import all services running  on your windows os 
you will use  extension as there is  

2- if you need to customize it  to specific services 
you will update  in two files  

firstly  in services.txt  you will add your services names you want to monitor 

second  in servicemonitor-shell.ps1  
you will remove next lines 
# Get all running services and save their names to the services.txt file
Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object -ExpandProperty Name | Out-File -FilePath "services.txt" -Force

 
