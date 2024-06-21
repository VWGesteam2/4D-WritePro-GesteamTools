var $typeSelection : Integer
var $nouveauNom : Text

If (Form:C1466#Null:C1517)  //ACI0100560
	If (Not:C34(Undefined:C82(Form:C1466.selection)))  //ACI0100560
		If (Form:C1466.selection#Null:C1517)  //ACI0100560
			If (Not:C34(Undefined:C82(Form:C1466.selection.type)))  //ACI0100560
				$typeSelection:=OB Get:C1224(Form:C1466.selection; "type"; Est un entier long:K8:6)
				If ($typeSelection=2)
					$nouveauNom:=Request:C163("Nouveau nom de l'image"; Form:C1466.selection.id)
					If ($nouveauNom#Form:C1466.selection.id)
						If (WP Get elements:C1550(Form:C1466.selection.owner; wk type image anchored:K81:248).findIndex("findStrId"; $nouveauNom)#-1)
							BEEP:C151
							ALERT:C41("Erreur :\r\nLe Nom choisi existe déjà")
						Else 
							Form:C1466.selection.id:=$nouveauNom
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
SET TIMER:C645(-1)
