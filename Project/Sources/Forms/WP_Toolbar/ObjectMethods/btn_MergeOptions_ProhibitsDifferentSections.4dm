C_POINTER:C301($ptr)
var $MergeOptions : cs:C1710.MergeOptions

// update font in selection
$ptr:=OBJECT Get pointer:C1124(Objet conteneur sous formulaire:K67:4)
If (Not:C34(Is nil pointer:C315($ptr)))
	If (OB Is defined:C1231($ptr->; "areaPointer"))
		$ptr:=OB Get:C1224($ptr->; "areaPointer")
		Case of 
			: (Not:C34(OB Is defined:C1231($ptr->; "MergeOptions")))
				$MergeOptions:=cs:C1710.MergeOptions.new(0)
			Else 
				$MergeOptions:=cs:C1710.MergeOptions.new($ptr->MergeOptions)
		End case 
		$MergeOptions.Set_ProhibitsDifferentSections(Not:C34(MO_AllowSectionsDiff))
		
		$ptr->MergeOptions:=$MergeOptions.GetOptionValue()
		SET TIMER:C645(-1)  //Force la maj des objets visuel
	End if 
End if 
