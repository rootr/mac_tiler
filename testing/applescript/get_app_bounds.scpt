global _appNames, _windowSizes, _windowPositions

tell application "System Events"
	set _processes to a reference to (processes whose background only = false)
	set _windows to a reference to windows of _processes
	
	set _appNames to item 1 of [_processes's name]
	set _windowSizes to item 1 of [_windows's size]
	set _windowPositions to item 1 of [_windows's position]
end tell

set theIndex to 0

repeat with appName in _appNames
	set theIndex to theIndex + 1
	set wSize to item theIndex of _windowSizes
	set wPos to item theIndex of _windowPositions
	
#	Check if the window has a size or not (has a window)
	if not (wSize as string) = "" then
#		Get each
		set wWidth to (item 1 of item 1 of wSize) as string
		set wHeight to (item 2 of item 1 of wSize) as string
		set wX to (item 1 of item 1 of wPos) as string
		set wY to (item 2 of item 1 of wPos) as string
		
		log (appName & "," & wWidth & "," & wHeight & "," & wX & "," & wY)
	end if
end repeat

# Electron,2159,1395,10,35
# firefox,1238,1392,2186,34
# Script Editor,1960,1167,768,126
# zoom.us,370,1007,-793,416
# Slack,1100,1010,-1910,395
# Messages,1000,996,-1810,397
# CodeRunner,2162,1395,10,35