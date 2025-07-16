# Chrome MCP for Claude Code (WSL)

Simple setup for Chrome MCP by hangwin to work with Claude Code running in WSL.

## What This Does

Enables Claude Code (running in WSL) to control Chrome browser (running on Windows) for automation tasks like:
- Web scraping
- Form filling
- Taking screenshots
- Browser automation

## Prerequisites

1. Claude Code installed in WSL
2. Chrome browser on Windows
3. Chrome MCP extension installed from: https://github.com/hangwin/mcp-chrome

## Quick Setup

### Step 1: Run WSL Setup
```bash
cd ~/chromemcphangwinclaudecode
./scripts/setup-chrome-mcp-wsl.sh
```

### Step 2: Run Windows Setup (as Administrator)
Open PowerShell as Administrator and run:
```powershell
cd \\wsl$\Ubuntu\home\info0\chromemcphangwinclaudecode
.\scripts\setup-wsl-connection.ps1
```

### Step 3: Start Chrome with Extension
1. Open Chrome on Windows
2. Click the Chrome MCP extension icon
3. Make sure it shows as "Connected"

### Step 4: Restart Claude Code
Close and reopen Claude Code for changes to take effect.

## Verify It's Working

In Claude Code, ask: "Can you open Google in Chrome?"

If successful, Chrome will open Google.com.

## Troubleshooting

### Connection Failed
If Chrome MCP isn't working:

1. Update Windows IP in WSL:
```bash
./scripts/update-wsl-ip.sh
```

2. Check Chrome extension is running:
- Look for server at http://127.0.0.1:12306/mcp

3. Verify firewall rule:
```powershell
Get-NetFirewallRule -DisplayName "Chrome MCP Server"
```

### Alternative: Use Proxy
If direct connection fails, use the proxy:
```bash
./scripts/start-chrome-proxy.sh
```

## Files in This Repository

- `scripts/setup-chrome-mcp-wsl.sh` - Main WSL setup
- `scripts/setup-wsl-connection.ps1` - Windows firewall/port setup
- `scripts/update-wsl-ip.sh` - Update IP configuration
- `scripts/start-chrome-proxy.sh` - Alternative proxy method
- `config/claude_desktop_config.json` - Claude Code MCP configuration
- `config/stdio-config.json` - Bridge configuration

## Important Notes

- Windows firewall must allow port 12306
- Chrome must be running before using MCP tools
- Restart Claude Code after configuration changes
- The Windows host IP may change - use update-wsl-ip.sh if needed

## Simple Test Commands

Ask Claude Code:
- "Open Google in Chrome"
- "Take a screenshot of the current page"
- "Get all open browser tabs"

## Support

For issues with:
- Chrome MCP extension: https://github.com/hangwin/mcp-chrome
- This setup: Create an issue in this repository