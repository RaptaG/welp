#!/usr/bin/env bash
# Installer for welp
set -e

# Root permission checker
if [ $EUID -ne 0 ]; then
	echo '$(basename $0) requires root permissions. Please run: sudo ./$(basename $0)'
	echo 'Exiting...'
	exit 1
fi

# Startup message
echo "Installer for RaptaG's welp script"

# Cloning the script and making it executable
download() {
	 echo 'Downloading the script...'
	 curl -Os https://raw.githubusercontent.com/RaptaG/welp/main/welp.sh
}

# Moving it to an executable location
install() {
         echo 'Installing the script...'
         chmod +x welp.sh
         mv welp.sh /usr/local/bin/welp
}

# Run the download and install commands
download "$@"
install "$@"

# Finish message
echo "Done! You can now use the script by running 'welp' in a terminal"

# Deleting the script
echo "The installer is now going to be deleted, so that you don't have to do it manually"
rm install.sh
exit 0
