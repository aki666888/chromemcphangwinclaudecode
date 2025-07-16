#!/bin/bash
# Script to update stdio-config.json with current Windows host IP

echo "Updating Chrome MCP configuration with current Windows host IP..."

# Get Windows host IP
WIN_HOST=$(ip route show | grep -i default | awk '{print $3}')
echo "Windows host IP: $WIN_HOST"

# Find stdio-config.json location
STDIO_CONFIG=$(find ~/.nvm -name "stdio-config.json" -path "*/mcp-chrome-bridge/*" 2>/dev/null | head -1)

if [ -z "$STDIO_CONFIG" ]; then
    echo "Error: Could not find stdio-config.json"
    echo "Make sure mcp-chrome-bridge is installed globally"
    exit 1
fi

echo "Found config at: $STDIO_CONFIG"

# Update the config file
echo "{
  \"url\": \"http://$WIN_HOST:12306/mcp\"
}" > "$STDIO_CONFIG"

echo "Updated stdio-config.json with Windows host IP: $WIN_HOST"
echo "Restart Claude Code for changes to take effect"