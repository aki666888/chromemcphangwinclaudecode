#!/bin/bash
# One-time setup script - Set and forget!

echo "=== Chrome MCP One-Time Setup ==="
echo ""
echo "This will configure Chrome MCP to work permanently with Claude Code."
echo ""

# Run WSL setup
echo "Step 1: Setting up Chrome MCP in WSL..."
./scripts/setup-chrome-mcp-wsl.sh

echo ""
echo "Step 2: Now you need to run the Windows setup as Administrator."
echo ""
echo "Copy and paste this command in PowerShell (Admin):"
echo ""
echo "cd \\\\wsl\$\\Ubuntu\\home\\info0\\chromemcphangwinclaudecode && .\\scripts\\setup-static-ip.ps1"
echo ""
echo "After running the Windows setup:"
echo "1. Run: wsl --shutdown"
echo "2. Start WSL again"
echo "3. Chrome MCP will work permanently with localhost!"
echo ""
echo "No IP updates needed ever again!"