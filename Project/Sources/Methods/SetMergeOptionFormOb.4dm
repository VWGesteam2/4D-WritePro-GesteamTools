//%attributes = {}
var $1 : Object  //Form ToolBar
var $2 : cs:C1710.MergeOptions  //Merge option to set
C_POINTER:C301($areaPointer)

If (($1#Null:C1517) & ($2#Null:C1517))
	If (OB Is defined:C1231($1; "areaPointer"))
		$areaPointer:=OB Get:C1224($1; "areaPointer")
		$areaPointer->MergeOptions:=$2.GetOptionValue()
	Else 
		BEEP:C151
		TRACE:C157
	End if 
Else 
	BEEP:C151
	TRACE:C157
End if 