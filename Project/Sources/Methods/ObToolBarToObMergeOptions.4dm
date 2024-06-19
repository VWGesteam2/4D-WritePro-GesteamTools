//%attributes = {}
C_OBJECT:C1216($1)
C_OBJECT:C1216($0)
$0:=Null:C1517

C_POINTER:C301($areaPointer)

If ($1#Null:C1517)
	If (OB Is defined:C1231($1; "areaPointer"))
		$areaPointer:=OB Get:C1224($1; "areaPointer")
		Case of 
			: (Not:C34(OB Is defined:C1231($areaPointer->; "MergeOptions")))
				$0:=cs:C1710.MergeOptions.new()
			Else 
				$0:=cs:C1710.MergeOptions.new(OB Get:C1224($areaPointer->; "MergeOptions"; Est un entier long:K8:6))
		End case 
	End if 
End if 