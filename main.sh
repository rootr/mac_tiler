#!/bin/bash
# Script that allows you to reposition and resize windows via shortcuts
# similar to a tiling window manager

updateBounds() {
	# TODO: Add a check to see if any Finder windows are active and get the size of those windows
	# List of currently running apps excluding Finder
  openApps=$(lsappinfo list | grep --color=never 'Foreground' -B4 | awk '/) "/ { print $0 }' | grep -iv 'Finder')

# Loops over each of the apps returned from $openApps
# each line
	while IFS='' read -r appWithExtra; do
		# Whether or not the app is hidden
		isHidden=$(grep -iEo --color=never '\([^\)]+\)' <<<"$appWithExtra" | sed -E 's/[()]//g')
		isHidden=$([[ "$isHidden" = "hidden" ]] && echo 'true' || 'false')
		# Get the name of the app
		appName=$(grep -iEo --color=never '"[^"]+"' <<<"$appWithExtra" | sed -E 's/"//g')
		# Check to make sure the app is not hidden
		if [ "$isHidden" != 'true' ]; then
			# Get the position of the app window
			windowDetails=$(osascript -e "tell app \"System Events\" to tell application process \"$appName\" to get {size,position} of window 1")
			
			appPos=$(awk -F',' '{ print $3 "," $4 }' <<<"$windowDetails")
			appSize=$(awk -F',' '{ print $1 "," $2 }' <<<"$windowDetails")
			
			echo -ne "$appName\n\tSize: $appSize\n\tPos: $appPos\n"
		fi
	done <<<"$openApps"
}

# Main initial function that runs to start the whole process
main() {
  # Run the function to get the bounds of the app windows
  updateBounds
}

main "$@"