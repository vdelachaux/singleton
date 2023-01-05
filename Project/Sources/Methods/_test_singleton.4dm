//%attributes = {}
var $p : Integer
var $motor; $motor2 : cs:C1710.motor
var $reporter : cs:C1710.report

$reporter:=cs:C1710.report.new(Folder:C1567(fk desktop folder:K87:19).file("DEV/singleton.log"))

$motor:=cs:C1710.motor.new()
$reporter.writeLine(Current method name:C684+": "+(Num:C11($motor.__LockerID)=0 ? "creation of the singleton" : String:C10($motor.__LockerID)))

$motor2:=cs:C1710.motor.new()
$reporter.writeLine(Current method name:C684+": "+(Num:C11($motor2.__LockerID)=0 ? "creation of the singleton" : String:C10($motor2.__LockerID)))

$p:=New process:C317("test_inNewProcess"; 0)

CALL WORKER:C1389("$test"; Formula:C1597(test_inNewWorker))