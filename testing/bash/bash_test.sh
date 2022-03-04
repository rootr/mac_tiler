#!/bin/bash

# Path to the AppleScript file
# When run, the AppleScript returns all running windows and their bounds
# The bounds are returned in csv format as shown below:
# @value: app_name,width,height,x,y
appBoundsScript='applescript_testing.applescript'

# Get the currently open apps and their window bounds
allApps=$(osascript "$appBoundsScript")

echo "$allApps"