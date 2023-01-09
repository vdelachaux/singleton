/*dependencies
{
  "classes": [
    "_classCore"
  ]
}
*/
Class extends _classCore

Class constructor($file)
	
	Super:C1705()
	
	Case of 
			
			//______________________________________________________
		: (This:C1470.isFile($file))
			
			This:C1470.file:=$file.path
			
			//______________________________________________________
		: (This:C1470.isText($file))
			
			$file:=This:C1470.isPlatformPath($file) ? File:C1566($file; fk platform path:K87:2) : File:C1566($file)
			This:C1470.file:=$file.path
			
			//______________________________________________________
		Else 
			
			ASSERT:C1129(False:C215; "file msut be a 4D.File or a Text (path or platformPath)")
			return 
			
			//______________________________________________________
	End case 
	
	This:C1470.file:=$file.path
	This:C1470.mode:="append"
	
	// Clear the log
	This:C1470.clear()
	
	// ☝️ Make it a singleton
	This:C1470.singletonize(This:C1470)
	
	This:C1470.ready:=True:C214
	
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
	