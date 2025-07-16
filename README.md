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

## Quick Setup (Set and Forget!)

### One-Time Setup
```bash
cd ~/chromemcphangwinclaudecode
./setup-once.sh
```

This will:
1. Install Chrome MCP in WSL
2. Configure it to use localhost (no IP changes needed!)
3. Give you the Windows command to run

### Run Windows Setup (as Administrator)
After running setup-once.sh, copy the command it shows and run in PowerShell as Admin.

Then:
1. Run: `wsl --shutdown`
2. Start WSL again
3. Done forever! No IP updates needed

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
With the static IP setup, you shouldn't need to update IPs anymore!

If Chrome MCP isn't working:

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
- Uses static localhost configuration - no IP updates needed!

## Simple Test Commands

Ask Claude Code:
- "Open Google in Chrome"
- "Take a screenshot of the current page"
- "Get all open browser tabs"

## Support

For issues with:
- Chrome MCP extension: https://github.com/hangwin/mcp-chrome
- This setup: Create an issue in this repository