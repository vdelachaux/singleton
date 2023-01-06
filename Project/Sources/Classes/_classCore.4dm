Class constructor
	
	This:C1470.ready:=False:C215
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get notReady() : Boolean
	
	return Not:C34(This:C1470.ready)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function singletonize($instance : Object)
	
	// Get the class of the object passed in parameter
	This:C1470.class:=OB Class:C1730($instance)
	
	If (This:C1470.class.instance=Null:C1517)
		
		// Create the instance
		Use (This:C1470.class)
			
			// As shareable
			This:C1470.class.instance:=OB Copy:C1225($instance; ck shared:K85:29; This:C1470.class)
			
			// Save the new function…
			This:C1470.class._new:=This:C1470.new
			
			// And replace it
			This:C1470.class.new:=Formula:C1597(This:C1470.instance)
			
		End use 
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isNum($value) : Boolean
	
	return (Value type:C1509($value)=Is longint:K8:6) | (Value type:C1509($value)=Is real:K8:4)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isText($value) : Boolean
	
	return (Value type:C1509($value)=Is text:K8:3)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isFile($value) : Boolean
	
	return (Value type:C1509($value)=Is object:K8:27) && (OB Instance of:C1731($value; 4D:C1709.File))
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isFolder($value) : Boolean
	
	return (Value type:C1509($value)=Is object:K8:27) && (OB Instance of:C1731($value; 4D:C1709.Folder))
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isPlatformPath($value) : Boolean
	
	return Match regex:C1019("(?mi-s)^(?:(?:\\\\{2})|(?:[a-zA-Z]:\\\\?)|(?:[^:]+:)|(?:[^.:/\\n\\\\]+)).*$"; $value; 1)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isJson($value) : Boolean
	
	return Match regex:C1019("\"(?si-m)^(?:\\\\{.*\\\\}$)|(?:^\\\\[.*\\\\]$)\""; $value; 1)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isJsonObject($value) : Boolean
	
	return Match regex:C1019("(?m-si)^\\{.*\\}$"; $value; 1)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isJsonArray($value) : Boolean
	
	return Match regex:C1019("(?m-si)^\\[.*\\]$"; $value; 1)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function debugerSafe($that : Object; $method; $type : Integer) : Variant
	
	Case of 
			
			//______________________________________________________
		: (This:C1470.ready)
			
			If (Value type:C1509($method)=Is object:K8:27)
				
				return $method.call(Null:C1517)
				
			Else 
				
				return $that[$method]()
				
			End if 
			//return $that[$method]()
			
			//______________________________________________________
		: ($type=Is boolean:K8:9)
			
			return False:C215
			
			//______________________________________________________
		: ($type=Is text:K8:3)
			
			return ""
			
			//______________________________________________________
		: ($type=Is integer:K8:5)
			
			return 0
			
			//______________________________________________________
		: ($type=Is object:K8:27)
			
			return Null:C1517
			
			//______________________________________________________
		: ($type=Is collection:K8:32)
			
			return Null:C1517
			
			//______________________________________________________
		: ($type=Is BLOB:K8:12)
			
			var $blob : Blob
			return $blob
			
			//______________________________________________________
		: ($type=Is picture:K8:10)
			
			var $pict : Picture
			return $pict
			
			//______________________________________________________
		Else 
			
			return 
			
			//______________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
	
	