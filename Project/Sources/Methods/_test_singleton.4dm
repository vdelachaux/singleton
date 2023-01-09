//%attributes = {}
var $p : Integer
var $motor; $motorInstance : cs:C1710.motor
var $reporter : cs:C1710.report

// Instantiate the reporter
$reporter:=cs:C1710.report.new(Folder:C1567(fk desktop folder:K87:19).file("DEV/singleton.log"))

// Instantiate class "motor"
$motor:=cs:C1710.motor.new()
$reporter.writeLine(Current method name:C684+": "+($motor.matrix ? "creation of the singleton" : $motor.uid))

// Instantiate class "motor" (must be equal to the first instance)
$motorInstance:=cs:C1710.motor.new()
$reporter.writeLine(Current method name:C684+": "+($motorInstance.matrix ? "creation of the singleton" : $motor.uid))

// Test in a new process
$p:=New process:C317("test_inNewProcess"; 0; "test"; $motor.uid)

// Test in a new worker
CALL WORKER:C1389("$test"; Formula:C1597(test_inNewWorker); $motor.uid)

_test_singleton_2

BEEP:C151