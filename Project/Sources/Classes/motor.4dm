/*dependencies
{
"classes": [
"_classCore"
]
}
*/
Class extends _classCore

Class constructor
	
	Super:C1705()
	
	This:C1470.exe:=Is macOS:C1572 ? Folder:C1567(Application file:C491; fk platform path:K87:2) : File:C1566(Application file:C491; fk platform path:K87:2)
	
	This:C1470._version:=Application version:C493
	This:C1470.__version:=Application version:C493(*)
	
	This:C1470.type:=Application type:C494
	This:C1470.versionType:=Version type:C495
	This:C1470.infos:=Get application info:C1599
	This:C1470.os:=Get system info:C1571
	
	This:C1470.ready:=True:C214
	
	// ☝️ Make it a singleton
	This:C1470.singletonize(This:C1470)
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get root() : 4D:C1709.Folder
	
	If (This:C1470.ready)
		
		return (Is macOS:C1572 ? This:C1470.exe.folder("Contents") : This:C1470.exe.parent)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get local() : Boolean
	
	If (This:C1470.ready)
		
		return (This:C1470.type=4D Local mode:K5:1) | (This:C1470.type=4D Desktop:K5:4)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get server() : Boolean
	
	If (This:C1470.ready)
		
		return (This:C1470.type=4D Server:K5:6)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get remote() : Boolean
	
	If (This:C1470.ready)
		
		return (This:C1470.type=4D Remote mode:K5:5)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get headless() : Boolean
	
	If (This:C1470.ready)
		
		return Bool:C1537(This:C1470.infos.headless)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get service() : Boolean
	
	If (This:C1470.ready)
		
		return Bool:C1537(This:C1470.infos.launchedAsService)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get demo() : Boolean
	
	If (This:C1470.ready)
		
		return (This:C1470.versionType ?? Demo version:K5:9)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get merged() : Boolean
	
	If (This:C1470.ready)
		
		return (This:C1470.versionType ?? Merged application:K5:28)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get branch() : Text
	
	return This:C1470._getVersion("branch")
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get buildNumber() : Integer
	
	var $version : Text
	var $buildNumber : Integer
	
	$version:=Application version:C493($buildNumber)
	return $buildNumber
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get version() : Text
	
	return This:C1470._getVersion("version")
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get shortVersion() : Text
	
	return This:C1470._getVersion("short-version")
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get longVersion() : Text
	
	return This:C1470._getVersion("long-version")
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get ipv4() : Text
	
	If (This:C1470.ready)\
		 && (This:C1470.os.networkInterfaces.length>0)\
		 && (This:C1470.os.networkInterfaces[0].ipAddresses#Null:C1517)\
		 && (This:C1470.os.networkInterfaces[0].ipAddresses.query("type = ipv4").length>0)
		
		return This:C1470.os.networkInterfaces[0].ipAddresses.query("type = ipv4").pop().ip
		
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get machine() : Text
	
	If (This:C1470.ready)
		
		return String:C10(This:C1470.os.machineName)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get arm() : Boolean
	
	If (This:C1470.ready)
		
		return (This:C1470.os.processor="Apple M@")
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get debug() : Boolean
	
	If (This:C1470.ready)
		
		return (Position:C15("debug"; This:C1470._version)>0)
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get newConnectionsAllowed() : Boolean
	
	If (This:C1470.ready)
		
		This:C1470.infos:=Get application info:C1599
		return This:C1470.infos.newConnectionsAllowed
		
	End if 
	
	//MARK:-
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function acceptNewConnections
	
	If (Asserted:C1132(This:C1470.server; Current method name:C684+" - In local mode this method does nothing"))
		
		REJECT NEW REMOTE CONNECTIONS:C1635(False:C215)
		This:C1470.infos:=Get application info:C1599
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function rejectNewConnections
	
	If (Asserted:C1132(This:C1470.server; Current method name:C684+" - In local mode this method does nothing"))
		
		REJECT NEW REMOTE CONNECTIONS:C1635(True:C214)
		This:C1470.infos:=Get application info:C1599
		
	End if 
	
	//MARK:-
	// *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
Function _getVersion($type : Text) : Text
	
	var $major; $release; $revision : Text
	var $c : Collection
	
/*
The Application version command returns an encoded string value that expresses
The version number of the 4D environment you are running.
	
- If you do not pass the optional * parameter, a 4-character string is returned,
	
formatted as follows:
1-2   LTS version
3     Release number
4     Revision number
	
ie:
"1800" for v18
"1820" for v18 Release 2
"1830" for v18 Release 3
"1801" for v18.1 (first fix release of v18)
"1802" for v18.2 (second fix release of v18)
	
- If you pass the optional * parameter, an 8-character string is returned,
	
formatted as follows:
1      "F" denotes a final version
"B" denotes a beta version
Other characters denote an 4D internal version
2-3-4  Internal 4D compilation number
5-6    LTS version
7      Release number
8      Revision number
*/
	
	If (This:C1470.notReady)
		
		return 
		
	End if 
	
	$c:=Split string:C1554(This:C1470._version; "")
	$major:=$c[0]+$c[1]  // LTS version
	$release:=$c[2]  // Release number
	$revision:=$c[3]  // Revision number
	
	Case of 
			
			//______________________________________________________
		: ($type="application")
			
			return Choose:C955(Num:C11(This:C1470.type); "4D local"; "4D Volume desktop"; "#NA"; "4D Desktop"; "4D Remote"; "4D Server")
			
			//______________________________________________________
		: ($type="product")
			
			// Returns the current product name ie. 4D v18
			return This:C1470._getVersion("application")+" v"+$major
			
			//______________________________________________________
		: ($type="major")
			
			return $major
			
			//______________________________________________________
		: ($type="version")
			
/*
Return the long version string of the product
Marketing + minor or release + build
*/
			
			If ($release="0")
				
				// 4D v18.1 build 18.128437
				return This:C1470._getVersion("short-version")+" build "+$major+"."+String:C10(This:C1470.buildNumber)
				
			Else 
				
				// 4D v18 R2 build 18R2.128437
				return This:C1470._getVersion("short-version")+" build "+$major+"R"+$release+"."+String:C10(This:C1470.buildNumber)
				
			End if 
			
			//______________________________________________________
		: ($type="long-version")
			
			$c:=Split string:C1554(This:C1470.__version; "")
			
			Case of 
					
					//………………………………………………………
				: ($c[0]="F")  // "F" denotes a final version
					
					return This:C1470._getVersion("version")
					
					//………………………………………………………
				: ($c[0]="B")  // "B" denotes a beta version
					
					return This:C1470._getVersion("version")+" (beta "+$c[1]+$c[2]+")"
					
					//………………………………………………………
				Else   // Other characters denote an 4D internal version ie: 4D v18 R6 build 18R6.257882 (A1)
					
					return This:C1470._getVersion("version")+" ("+$c[0]+$c[3]+")"
					
					//………………………………………………………
			End case 
			
			//______________________________________________________
		: ($type="short-version")
			
/*
Return the short version string of the product
Marketing + minor or release
*/
			
			If ($release="0")
				
				// Revision number
				return This:C1470._getVersion("product")+Choose:C955($revision#"0"; "."+$revision; "")
				
			Else 
				
				// Release number
				return This:C1470._getVersion("product")+" R"+$release
				
			End if 
			
			//______________________________________________________
		: ($type="web-version")
			
/*
Return the short version string of the product
minor or release without space for web compatibility
*/
			
			If ($release="0")
				
				// 14
				return Replace string:C233(This:C1470._getVersion("major"); " "; "")
				
			Else 
				
				// 14R5
				return Replace string:C233(This:C1470._getVersion("major")+"R"+$release; " "; "")
				
			End if 
			
			//______________________________________________________
		: ($type="build")
			
			return String:C10(This:C1470.buildNumber)
			
			//______________________________________________________
		: ($type="branch")
			
			If ($release="0")
				
				// Revision number
				return $major+Choose:C955($revision#"0"; "."+$revision; "")
				
			Else 
				
				// Release number
				return $major+"R"+$release
				
			End if 
			
			//______________________________________________________
			
		Else 
			
			This:C1470._pushError(Current method name:C684+": Unknown entry point: \""+$type+"\"")
			
			//______________________________________________________
	End case 
	
	// *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
Function _isPreemptive() : Boolean
	
	var $name : Text
	var $id; $mode; $origin; $state : Integer
	var $time : Time
	
	PROCESS PROPERTIES:C336(Current process:C322; $name; $state; $time; $mode; $id; $origin)
	
	return $mode ?? 1
	
	//MARK:-⚠️ NOT THREAD SAFE
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function restart($delay : Integer; $message : Text)
	
	If (This:C1470._isPreemptive())
		
		//%T-
		If (Count parameters:C259>=2)
			
			RESTART 4D:C1292($delay; $message)
			
		Else 
			
			RESTART 4D:C1292($delay)
			
		End if 
		//%T+
		
		This:C1470.success:=Bool:C1537(OK)
		
	Else 
		
		This:C1470._pushError(Current method name:C684+" cannot be called from a preemptive process.")
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function quit($delay : Integer)
	
	If (This:C1470._isPreemptive())
		
		//%T-
		QUIT 4D:C291($delay)
		//%T+
		
	Else 
		
		This:C1470._pushError(Current method name:C684+" cannot be called from a preemptive process.")
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function setUpdateFolder($folder; $silent : Boolean)
	
	If (This:C1470._isPreemptive())
		
		//%T-
		Case of 
				//______________________________________________________
			: (This:C1470.isFolder($folder))
				
				SET UPDATE FOLDER:C1291(String:C10($folder.platformPath); $silent)
				This:C1470.success:=Bool:C1537(OK)
				
				//______________________________________________________
			: (This:C1470.isText($folder))
				
				var $f : 4D:C1709.Folder
				$f:=This:C1470.isPlatformPath($folder) ? Folder:C1567($folder; fk platform path:K87:2) : Folder:C1567($folder)
				SET UPDATE FOLDER:C1291($f.platformPath; $silent)
				This:C1470.success:=Bool:C1537(OK)
				
				//______________________________________________________
			Else 
				
				This:C1470._pushError("The folder must be a 4D.Folder, a Path or a Pathname")
				
				//______________________________________________________
		End case 
		//%T+
		
	Else 
		
		This:C1470._pushError(Current method name:C684+" cannot be called from a preemptive process.")
		
	End if 
	