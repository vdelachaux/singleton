Class constructor($file : 4D:C1709.File)
	
	This:C1470.file:=$file.path
	This:C1470.mode:="append"
	
	// Clear the log
	This:C1470.clear()
	
	// Make a singleton
	cs:C1710.singleton.new(This:C1470)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function clear()
	
	File:C1566(This:C1470.file).setText("")
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function open() : 4D:C1709.FileHandle
	
	var $file : 4D:C1709.File
	var $handler : 4D:C1709.FileHandle
	
	$file:=File:C1566(This:C1470.file)
	$handler:=$file.open(This:C1470.mode)
	
	return $handler
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function writeLine($line : Text)
	
	var $handler : 4D:C1709.FileHandle
	
	$handler:=This:C1470.open()
	$handler.writeLine($line)