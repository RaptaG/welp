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
    echo -n 'Enter the name of the command you want to search for: '
    read command
    
    # Programming language
    echo -n 'In which programming language to search? '
    read plang
    
    # Opening
    echo 'Opening in the browser...'
    case "$OSTYPE" in
         linux*)
         xdg-open https://duckduckgo.com/?q=$command+command+function+in+$plang
         ;;
         *)
         open https://duckduckgo.com/?q=$command+command+function+in+$plang
         ;;
    esac
}

# Run the command searcher and exit
csearch "$@"
exit
