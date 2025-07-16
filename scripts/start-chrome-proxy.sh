#!/bin/bash
# Script to proxy Chrome MCP connection from WSL to Windows

echo "Starting Chrome MCP proxy for WSL2..."

# Get Windows host IP
WIN_HOST=$(ip route show | grep -i default | awk '{print $3}')
echo "Windows host IP: $WIN_HOST"

# Install socat if not available
if ! command -v socat &> /dev/null; then
    echo "Installing socat..."
    sudo apt-get update && sudo apt-get install -y socat
fi

# Kill any existing socat process on port 12306
pkill -f "socat.*12306" 2>/dev/null

# Start socat to forward localhost:12306 to Windows host:12306
echo "Starting port forwarding from 127.0.0.1:12306 to $WIN_HOST:12306..."
socat TCP-LISTEN:12306,fork,reuseaddr,bind=127.0.0.1 TCP:$WIN_HOST:12306 &

echo "Proxy started with PID $!"
echo "Chrome MCP should now be accessible at http://127.0.0.1:12306/mcp"
echo ""
echo "To stop the proxy, run: pkill -f 'socat.*12306'"