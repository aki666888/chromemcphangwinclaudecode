# Chrome MCP Quick Reference

## One-Time Setup (Set & Forget!)

### Run this ONCE:
```bash
cd ~/chromemcphangwinclaudecode
./setup-once.sh
```

Follow the instructions it gives you.
After setup, Chrome MCP will always work with localhost!

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
With static IP setup, connection should always work!
Just ensure Chrome extension is running.

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