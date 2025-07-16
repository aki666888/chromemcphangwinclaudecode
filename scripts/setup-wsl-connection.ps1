# PowerShell script to fix Chrome MCP connection for WSL2
# Run this from Windows PowerShell as Administrator

Write-Host "Setting up Chrome MCP connection for WSL2..." -ForegroundColor Green

# Add Windows Firewall rule for port 12306
Write-Host "Adding firewall rule for port 12306..." -ForegroundColor Yellow
New-NetFirewallRule -DisplayName "Chrome MCP Server" -Direction Inbound -Protocol TCP -LocalPort 12306 -Action Allow -Profile Any -ErrorAction SilentlyContinue

# Remove existing port proxy rules
Write-Host "Removing existing port proxy rules..." -ForegroundColor Yellow
netsh interface portproxy delete v4tov4 listenport=12306 listenaddress=* 2>$null

# Add port proxy to make Chrome MCP accessible from all interfaces
Write-Host "Setting up port forwarding..." -ForegroundColor Yellow
netsh interface portproxy add v4tov4 listenport=12306 listenaddress=* connectport=12306 connectaddress=127.0.0.1

# Show current port proxy rules
Write-Host "`nCurrent port forwarding rules:" -ForegroundColor Green
netsh interface portproxy show v4tov4

Write-Host "`nDone! Chrome MCP should now be accessible from WSL2." -ForegroundColor Green
Write-Host "Restart Claude Code for changes to take effect." -ForegroundColor Yellow