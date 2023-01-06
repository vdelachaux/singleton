//%attributes = {}
var $motor : cs:C1710.motor
var $reporter : cs:C1710.report

$motor:=cs:C1710.motor.new()

$reporter:=cs:C1710.report.new(Folder:C1567(fk desktop folder:K87:19).file("DEV/singleton.log"))
$reporter.writeLine(Current method name:C684+": "+(Num:C11($motor.__LockerID)=0 ? "creation of the singleton" : String:C10($motor.__LockerID)))

var $process : cs:C1710.process
$process:=cs:C1710.process.new()

If ($process.worker)
	
	ALERT:C41(Current method name:C684)
	
End if 