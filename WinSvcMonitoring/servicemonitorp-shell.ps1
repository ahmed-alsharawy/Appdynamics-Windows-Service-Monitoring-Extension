# Get all running services and save their names to the services.txt file
Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object -ExpandProperty Name | Out-File -FilePath "services.txt" -Force

# Now monitor these services (same as your original script)
$ServiceNames = Get-Content -Path "services.txt" | Where-Object { $_ -ne "" }

foreach ($serviceName in $ServiceNames) {
    $status = ((Get-Service -Name $serviceName -ErrorAction SilentlyContinue).status | select-string Running | Measure-Object -line).lines
    $y = "name=Custom Metrics|ServiceMonitor|$serviceName|status,aggregator=OBSERVATION,value="
    Write-Output ($y+$status)
}