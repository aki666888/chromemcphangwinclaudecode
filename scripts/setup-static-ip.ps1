# PowerShell script to set static IP for WSL2
# Run as Administrator

Write-Host "Setting up static IP configuration for WSL2..." -ForegroundColor Green

# Create .wslconfig if it doesn't exist
$wslConfigPath = "$env:USERPROFILE\.wslconfig"

$wslConfig = @"
[wsl2]
memory=4GB
processors=2
localhostForwarding=true

[experimental]
autoMemoryReclaim=gradual
networkingMode=mirrored
hostAddressLoopback=true
"@

Write-Host "Creating .wslconfig with static networking..." -ForegroundColor Yellow
$wslConfig | Out-File -FilePath $wslConfigPath -Encoding UTF8

Write-Host "WSL config created at: $wslConfigPath" -ForegroundColor Cyan

# Add Windows Firewall rule
Write-Host "Adding firewall rule for Chrome MCP..." -ForegroundColor Yellow
New-NetFirewallRule -DisplayName "Chrome MCP Server" -Direction Inbound -Protocol TCP -LocalPort 12306 -Action Allow -Profile Any -ErrorAction SilentlyContinue

Write-Host "`nConfiguration complete!" -ForegroundColor Green
Write-Host "With mirrored networking mode, WSL2 will use the same network as Windows." -ForegroundColor Cyan
Write-Host "You can now use localhost (127.0.0.1) consistently!" -ForegroundColor Cyan
Write-Host "`nPlease restart WSL2 for changes to take effect:" -ForegroundColor Yellow
Write-Host "  wsl --shutdown" -ForegroundColor White
Write-Host "  Then start WSL again" -ForegroundColor White