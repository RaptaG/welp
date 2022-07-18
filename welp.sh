#!/usr/bin/env bash
# Made by RaptaG
set -e

# Definitions
ver=1.1

# Startup message
echo "welp, version $ver (by RaptaG)"

# Command searcher
csearch() {
    # Command
    echo -n "Enter the name of the command you want to search for: "
    read command
    
    # Programming language
    echo -n "In which programming language to search? "
    read plang
    
    # Open
    echo "Opening in the browser..."
    case "$OSTYPE" in
         linux-gnu)
         xdg-open https://duckduckgo.com/?q=$command+command+function+in+$plang
         ;;
         darwin)
         open https://duckduckgo.com/?q=$command+command+function+in+$plang
         ;;
    esac
}

# Run the command searcher and exit
csearch "$@"
exit 0
