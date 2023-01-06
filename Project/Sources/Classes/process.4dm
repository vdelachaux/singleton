/*dependencies
{
  "classes": [
    "_classCore"
  ]
}
*/
Class extends _classCore

Class constructor($process)
	
	Super:C1705()
	
	Case of 
			
			//______________________________________________________
		: (Count parameters:C259=0)
			
			This:C1470.number:=Current process:C322
			
			//______________________________________________________
		: (This:C1470.isNum($process))
			
			This:C1470.number:=$process
			
			//______________________________________________________
		: (This:C1470.isText($process))
			
			This:C1470.number:=Process number:C372($process)
			
			//______________________________________________________
		Else 
			
			ASSERT:C1129(False:C215; "process paramater must be a Num or a Text")
			return 
			
			//______________________________________________________
	End case 
	
	This:C1470.name:=""
	This:C1470.state:=Does not exist:K13:3
	This:C1470.time:=0
	This:C1470.mode:=0
	This:C1470.id:=0
	This:C1470.origin:=0
	
	If (Num:C11(This:C1470.number)#0)
		
		var $name : Text
		var $id; $mode; $origin; $state : Integer
		var $time : Time
		
		PROCESS PROPERTIES:C336(This:C1470.number; $name; $state; $time; $mode; $id; $origin)
		
		This:C1470.name:=$name
		This:C1470.state:=$state
		This:C1470.time:=$time
		This:C1470.mode:=$mode
		This:C1470.id:=$id
		This:C1470.origin:=$origin
		
	End if 
	
	This:C1470.ready:=True:C214
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get preemptive() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isPreemptive()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get cooperative() : Boolean
	
	return Not:C34(This:C1470.preemptive)
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get userProcess() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isUser()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get motorProcess() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isInternal()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get worker() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isWorker()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get web() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isWeb()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get macro() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isMacro()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get frontmost() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isFrontmost()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get visible() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isVisible()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get hidden() : Boolean
	
	return Not:C34(This:C1470.visible)
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get exists() : Boolean
	
	return Not:C34(This:C1470.notExists)
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get notExists() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.doesNotExist()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get aborted() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isAborted()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get executing() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isExecuting()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get delayed() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isDelayed()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get waiting() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isWaiting()
		
	End if 
	
	// <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==> <==>
Function get paused() : Boolean
	
	If (This:C1470.ready)
		
		return This:C1470.isPaused()
		
	End if 
	
	// Mark:-
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isPreemptive() : Boolean
	
	return This:C1470.mode ?? 1
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isCooperative() : Boolean
	
	return Not:C34(This:C1470.isPreemptive())
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
	// Process generated by the user
Function isUser() : Boolean
	
	return This:C1470.origin>0
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
	//4D’s internal process
Function isInternal() : Boolean
	
	return This:C1470.origin<0
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isWorker() : Boolean
	
	return This:C1470.origin=Worker process:K36:32
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isWeb() : Boolean
	
	return This:C1470.name="Web Process#@"
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isMacro() : Boolean
	
	return This:C1470.name="Macro_Call"
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isFrontmost($withFloating : Boolean) : Boolean
	
	return $withFloating ? This:C1470.number=Frontmost process:C327(*) : This:C1470.number=Frontmost process:C327
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isVisible() : Boolean
	
	This:C1470._update()
	return This:C1470.mode ?? 0
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isHidden() : Boolean
	
	return Not:C34(This:C1470.isVisible())
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function doesNotExist() : Boolean
	
	This:C1470._update()
	return This:C1470.state=Does not exist:K13:3
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isAborted() : Boolean
	
	This:C1470._update()
	return This:C1470.state=Aborted:K13:1
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isExecuting() : Boolean
	
	This:C1470._update()
	return This:C1470.state=Executing:K13:4
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isDelayed() : Boolean
	
	This:C1470._update()
	return This:C1470.state=Delayed:K13:2
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isWaiting() : Boolean
	
	This:C1470._update()
	return (This:C1470.state=Waiting for user event:K13:9)\
		 | (This:C1470.state=Waiting for input output:K13:7)\
		 | (This:C1470.state=Waiting for internal flag:K13:8)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function isPaused() : Boolean
	
	This:C1470._update()
	return This:C1470.state=Paused:K13:6
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
	// Brings all the windows belonging to the process to the front
Function bringToFront() : cs:C1710.process
	
	BRING TO FRONT:C326(This:C1470.number)
	return This:C1470
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
	// Displays all the windows belonging to the process
Function show() : cs:C1710.process
	
	SHOW PROCESS:C325(This:C1470.number)
	return This:C1470
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
	// Hides all windows that belong to the process
Function hide() : cs:C1710.process
	
	HIDE PROCESS:C324(This:C1470.number)
	return This:C1470
	
	//=================================================================
	// Delays the execution of the process for a number of ticks (1 tick = 1/60th of a second)
Function delay($delay : Integer) : cs:C1710.process
	
	DELAY PROCESS:C323(This:C1470.number; $delay)
	return This:C1470
	
	//=================================================================
	// Suspends the execution of the process until it is reactivated
Function pause() : cs:C1710.process
	
	PAUSE PROCESS:C319(This:C1470.number)
	return This:C1470
	
	//=================================================================
	// Resumes a process whose execution has been paused or delayed
Function resume($show : Boolean) : cs:C1710.process
	
	RESUME PROCESS:C320(This:C1470.number)
	
	If ($show)
		
		SHOW PROCESS:C325(This:C1470.number)
		
	End if 
	
	return This:C1470
	
	// Mark:-
	// *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
Function _update
	
	If (This:C1470.ready)
		
		var $name : Text
		var $mode; $state : Integer
		var $time : Time
		
		PROCESS PROPERTIES:C336(This:C1470.number; $name; $state; $time; $mode)
		
		This:C1470.state:=$state
		This:C1470.time:=$time
		This:C1470.mode:=$mode
		
	End if 