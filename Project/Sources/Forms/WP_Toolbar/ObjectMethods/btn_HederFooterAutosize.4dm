C_OBJECT:C1216($selection)
C_POINTER:C301($ptr)

// update font in selection
$ptr:=OBJECT Get pointer:C1124(Objet conteneur sous formulaire:K67:4)
If (Not:C34(Is nil pointer:C315($ptr)))
	If (OB Is defined:C1231($ptr->; "selection"))
		$selection:=OB Get:C1224($ptr->; "selection"; Est un objet:K8:27)
		If ($selection#Null:C1517)
			If (HeaderFooterAutofit)
				WP SET ATTRIBUTES:C1342($selection.owner; wk header and footer autofit:K81:303; wk true:K81:174)
			Else 
				WP SET ATTRIBUTES:C1342($selection.owner; wk header and footer autofit:K81:303; wk false:K81:173)
			End if 
		End if 
	End if 
End if 
