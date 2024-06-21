C_POINTER:C301($ptr)
C_COLLECTION:C1488($sections)
C_LONGINT:C283($cpt)
// update font in selection
$ptr:=OBJECT Get pointer:C1124(Objet conteneur sous formulaire:K67:4)
If (Not:C34(Is nil pointer:C315($ptr)))
	If (OB Is defined:C1231($ptr->; "areaPointer"))
		$ptr:=OB Get:C1224($ptr->; "areaPointer")
		$sections:=WP Get sections:C1580(WP Selection range:C1340($ptr->))
		For ($cpt; 0; $sections.length-1)
			WP DELETE FOOTER:C1589($sections[$cpt])
		End for 
	End if 
End if 
