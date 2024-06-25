C_POINTER:C301($ptr)

// update font in selection
$ptr:=OBJECT Get pointer:C1124(Objet conteneur sous formulaire:K67:4)
If (Not:C34(Is nil pointer:C315($ptr)))
	If (OB Is defined:C1231($ptr->; "areaPointer"))
		$ptr:=OB Get:C1224($ptr->; "areaPointer")
		$ptr->MergeOptions:=cs:C1710.MergeOptions.new().GetOptionValueDefault()
		SET TIMER:C645(-1)  //Force la maj des objets visuel
	End if 
End if 
