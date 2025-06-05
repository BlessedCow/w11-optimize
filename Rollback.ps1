# Enable Bing Search again
Remove-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -ErrorAction SilentlyContinue

# Enable Widgets
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
  -Name "TaskbarDa" -Value 1

Stop-Process -Name "explorer" -Force
