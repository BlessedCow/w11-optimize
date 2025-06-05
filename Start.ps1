# Disable Bing Search in Windows Search
Write-Output "Disabling Bing search integration..."

New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Force | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Type DWord -Value 1

# (Optional) Restart Windows Search to apply immediately
Stop-Process -Name "SearchHost" -Force -ErrorAction SilentlyContinue
Write-Output "Bing Search disabled."

# Remove Weather/News Widget from Taskbar
Write-Output "Hiding Taskbar Widgets..."

New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
  -Name "TaskbarDa" -PropertyType DWord -Value 0 -Force

Write-Output "Weather widget hidden."

# Refresh Explorer to reflect changes
Stop-Process -Name "explorer" -Force
