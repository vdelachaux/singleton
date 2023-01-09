//%attributes = {}
var $errorNumber : Integer
var $reporter; $reporterInstance : cs:C1710.report

$reporter:=cs:C1710.report.new("Macintosh HD:Users:vdl:Desktop:DEV:singleton.log")
ASSERT:C1129($reporter.success)

$errorNumber:=$reporter.errors.length

$reporter._pushError("Error 1")
ASSERT:C1129($reporter.fail)
ASSERT:C1129($reporter.errors.length=($errorNumber+1))

$reporterInstance:=cs:C1710.report.new()
ASSERT:C1129($reporterInstance.uid=$reporter.uid)
ASSERT:C1129($reporterInstance.fail)
ASSERT:C1129($reporterInstance.errors.length=($errorNumber+1))

$reporterInstance.succeed()
ASSERT:C1129($reporterInstance.success)
ASSERT:C1129($reporter.success)

$errorNumber+=1

$reporterInstance._pushError("Error 2")
ASSERT:C1129($reporterInstance.fail)
ASSERT:C1129($reporterInstance.errors.length=($errorNumber+1))
ASSERT:C1129($reporter.fail)
ASSERT:C1129($reporter.errors.length=($errorNumber+1))

$reporter.succeed()
ASSERT:C1129($reporter.success)
ASSERT:C1129($reporterInstance.success)