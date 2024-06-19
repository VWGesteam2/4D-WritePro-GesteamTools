C_OBJECT:C1216($imageSelect)
C_OBJECT:C1216($WpDocument)
C_COLLECTION:C1488($colImagesAnchored)
C_LONGINT:C283($index)
$index:=ImagesDocumentInfo
ImagesDocumentInfo:=-1
If ($index>0)
	If (Form:C1466#Null:C1517)
		$WpDocument:=ObToolBarToDocument(Form:C1466)
		If ($WpDocument#Null:C1517)
			If (Not:C34(OB Is empty:C1297($WpDocument)))
				$colImagesAnchored:=WP Get elements:C1550($WpDocument; wk type image anchored:K81:248)
				If ($colImagesAnchored.length>0)
					$index:=$colImagesAnchored.findIndex("findStrId"; ImagesDocumentInfo{$index})
					If ($index>=0)
						EXECUTE METHOD:C1007("WPTB_Gesteam_InfoImage"; *; areaName; OBJECT Get pointer:C1124(Objet conteneur sous formulaire:K67:4); $colImagesAnchored[$index])
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
