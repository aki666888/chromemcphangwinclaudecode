#!/bin/bash
# Complete setup script for Chrome MCP in WSL

echo "=== Chrome MCP Setup for Claude Code in WSL ==="
echo ""

# Check if running in WSL
if ! grep -qi microsoft /proc/version; then
    echo "Error: This script is designed for WSL (Windows Subsystem for Linux)"
    exit 1
fi

# Install Node.js if not present
if ! command -v node &> /dev/null; then
    echo "Installing Node.js via nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    source ~/.bashrc
    nvm install --lts
    nvm use --lts
fi

echo "Node.js version: $(node --version)"

# Install mcp-chrome-bridge globally
echo "Installing mcp-chrome-bridge..."
npm install -g mcp-chrome-bridge

# Find and update stdio-config.json
WIN_HOST=$(ip route show | grep -i default | awk '{print $3}')
echo "Windows host IP: $WIN_HOST"

STDIO_CONFIG=$(find ~/.nvm -name "stdio-config.json" -path "*/mcp-chrome-bridge/*" 2>/dev/null | head -1)
if [ -n "$STDIO_CONFIG" ]; then
    echo "{
  \"url\": \"http://$WIN_HOST:12306/mcp\"
}" > "$STDIO_CONFIG"
    echo "Updated stdio-config.json"
fi

# Add Chrome MCP to Claude Code
echo "Adding Chrome MCP to Claude Code..."
claude mcp add chrome-mcp -t stdio "node" "$(which mcp-chrome-bridge)/../../lib/node_modules/mcp-chrome-bridge/dist/mcp/mcp-server-stdio.js"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "1. Run the Windows setup script as Administrator:"
echo "   powershell.exe -ExecutionPolicy Bypass -File ./scripts/setup-wsl-connection.ps1"
echo ""
echo "2. Make sure Chrome is running with the MCP extension"
echo ""
echo "3. Restart Claude Code"
echo ""
echo "The Chrome MCP tools will then be available!"