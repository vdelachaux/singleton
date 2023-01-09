//%attributes = {"invisible":true}
#DECLARE($uid : Text)

If (False:C215)
	C_TEXT:C284(test_inNewWorker; $1)
End if 

var $motor : cs:C1710.motor
var $reporter : cs:C1710.report

// Instantiate class "motor" (must be equal to the first instance if previously instantiated)
$motor:=cs:C1710.motor.new()
ASSERT:C1129($motor.uid=$uid)

$reporter:=cs:C1710.report.new(Folder:C1567(fk desktop folder:K87:19).file("DEV/singleton.log"))
$reporter.writeLine(Current method name:C684+": "+($motor.matrix ? "creation of the singleton" : $motor.uid))

ASSERT:C1129(cs:C1710.process.new().worker)