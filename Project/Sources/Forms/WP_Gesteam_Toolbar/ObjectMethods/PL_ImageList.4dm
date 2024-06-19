C_OBJECT:C1216($imageSelect)
C_OBJECT:C1216($WpDocument)
C_COLLECTION:C1488($colImagesAnchored)
C_LONGINT:C283($index)
Case of 
	: (ImagesDocument<=0)
	: (Form:C1466=Null:C1517)
	Else 
		$WpDocument:=ObToolBarToDocument(Form:C1466)
		Case of 
			: ($WpDocument=Null:C1517)
			: (OB Is empty:C1297($WpDocument))
			Else 
				$colImagesAnchored:=WP Get elements:C1550($WpDocument; wk type image anchored:K81:248)
				If ($colImagesAnchored.length>0)
					$index:=$colImagesAnchored.findIndex("findStrId"; ImagesDocument{ImagesDocument})
					If ($index>=0)
						WP SELECT:C1348(*; Form:C1466.areaName; $colImagesAnchored[$index])
						Form:C1466.picture:=$colImagesAnchored[$index]
						Form:C1466.selection:=WP Selection range:C1340(*; Form:C1466.areaName)
						//Force un appel à l'évent `Sur minuteur` pour que "tout" se mette à jour
						SET TIMER:C645(-1)
					End if 
				End if 
		End case 
End case 