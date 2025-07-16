# Chrome MCP Quick Reference

## One-Time Setup

### In WSL:
```bash
cd ~/chromemcphangwinclaudecode
./scripts/setup-chrome-mcp-wsl.sh
```

### In Windows PowerShell (Admin):
```powershell
cd \\wsl$\Ubuntu\home\info0\chromemcphangwinclaudecode
.\scripts\setup-wsl-connection.ps1
```

### Restart Claude Code

## Daily Use

1. Start Chrome on Windows
2. Click Chrome MCP extension icon (should show "Connected")
3. Use Claude Code normally

## Common Commands

Ask Claude Code:
- "Open Google in Chrome"
- "Take a screenshot"
- "Get all browser tabs"
- "Navigate to [URL]"
- "Click on [element]"
- "Fill form field [name] with [value]"

## Troubleshooting

### If connection fails:
```bash
cd ~/chromemcphangwinclaudecode
./scripts/update-wsl-ip.sh
```
Then restart Claude Code

### Alternative proxy method:
```bash
./scripts/start-chrome-proxy.sh
```

## Check Status

In Claude Code, type: `/mcp`

Should show:
- Chrome-mcp MCP Server
- Status: ✔ connected
- Tools: 23 tools