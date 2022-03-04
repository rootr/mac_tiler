#!/usr/bin/env osa -l JavaScript

// This function is run automatically on script run
(() => {
//	The global 'System Events' process
	const sysEvents = Application('System Events');
	sysEvents.includeStandardAdditions = true
//	Currently running processes, not in the background
	const _processes = sysEvents.processes.whose({ backgroundOnly: false })
//	
	
	debugger;
	
	console.log(JSON.stringify(_processes))
})()

//tell application "System Events"
//set _processes to a reference to (processes whose background only = false)
//set _windows to a reference to windows of _processes
//
//set _appNames to item 1 of [_processes's name]
//	set _windowSizes to item 1 of [_windows's size]
//set _windowPositions to item 1 of [_windows's position]
//	
//	set theIndex to 0
//	
//	repeat with appName in _appNames
//		set theIndex to theIndex + 1
//		set wSize to item theIndex of _windowSizes
//		set wPos to item theIndex of _windowPositions
//		
//		#		Check if the window has a size or not (has a window)
//		if not (wSize as string) = "" then
//			#			Get each
//			set wWidth to (item 1 of item 1 of wSize) as string
//			set wHeight to (item 2 of item 1 of wSize) as string
//			set wX to (item 1 of item 1 of wPos) as string
//			set wY to (item 2 of item 1 of wPos) as string
//			
//			log (appName & "," & wWidth & "," & wHeight & "," & wX & "," & wY)
//		end if
//	end repeat
//end tell