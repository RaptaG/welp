#!/usr/bin/env bash
# Installer for welp
set -e

# Definitions
fname="$(basename $0)"

# Root permission checker
if [ $EUID -ne 0 ]; then
	echo "Error: $fname requires root permissions. Please run 'sudo ./$fname'"
	exit 1
fi

# Startup message
echo "Installer/Uninstaller for RaptaG's welp script"

# Clone the script
download() {
	echo "Downloading the script..."
	cd /tmp/
	curl -Os https://raw.githubusercontent.com/RaptaG/welp/main/welp.sh
}

# Make it executable and move it to an executable location
install() {
	echo "Installing the script..."
	cd /tmp/
	chmod +x welp.sh
	cd /usr/local/bin
	if [ -f welp ]; then
		rm welp
		mv /tmp/welp.sh welp
	else
		mv /tmp/welp.sh welp
	fi
}

# Uninstall
remove() {
	echo "Uninstalling welp..."
	cd /usr/local/bin/
	if [ -f welp ]; then
		rm welp
		echo "Exiting..."
		exit 0
	else
		echo "Error: welp is already uninstalled, exiting..."
		exit 1
	fi
	
}

# Select option
case "$1" in
-h | --help)
	echo -e "Usage: $fname [OPTION]\n"
    	echo -e "\n-h, --help       This help menu\n"
    	echo -e "\n-i, --install    Download and install welp\n"
	echo -e "\n-r, --remove     Remove welp from your system\n"
	echo -e "\nThe main repo with the source code, the license and all the info related is availiable here:\nhttps://github.com/RaptaG/welp"
	;;
-i | --install)
	download "$@"
	install "$@"
	echo "Done! You can now use the script by running 'welp' in a terminal"
	exit 0
	;;
-r | --remove)
	remove "$@"
	;;
*)
	echo "Invalid option '$1'. Please run 'sudo ./$fname --help' for more information."
	exit 1
	;;
esac
