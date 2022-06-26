#!/usr/bin/env bash
# Made by RaptaG

# Crash checker
set -e

# Definitions
ver=1.0

# Startup message
echo 'welp, version $ver (by RaptaG)'

# Command searcher
csearch() {
    # Command
    echo -n 'Enter the command you want to search: '
    read command
    
    # Programming language
    echo -n 'In which programming language to search? '
    read plang
    
    # Opening
    echo 'Opening in the browser..'
    xdg-open https://duckduckgo.com/?q=$command+command+function+in+$plang
}

# Run the command searcher and exir
csearch "$@"
exit
