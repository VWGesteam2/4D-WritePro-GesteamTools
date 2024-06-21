//ATTENTION : ici on se base sur la valeur du tableau ImagesDocument (qui à l'index de l'image en cour de séléction)
// -> ET SURTOUT, on NE réinitialise PAS
C_OBJECT:C1216($WpDocument)
C_OBJECT:C1216($imageSelect)
C_COLLECTION:C1488($colImagesAnchored)
C_LONGINT:C283($index)
If (Form:C1466#Null:C1517)
	$WpDocument:=ObToolBarToDocument(Form:C1466)
End if 
If ($WpDocument#Null:C1517)
	If (Not:C34(OB Is empty:C1297($WpDocument)))
		Case of 
			: (ImagesDocument>0)  //Image ancrée
				$colImagesAnchored:=WP Get elements:C1550($WpDocument; wk type image anchored:K81:248)
				If ($colImagesAnchored.length>0)
					$index:=$colImagesAnchored.findIndex("findStrId"; ImagesDocument{ImagesDocument})
					If ($index>=0)
						EXECUTE METHOD:C1007("WPTB_Gesteam_InfoImage"; *; areaName; OBJECT Get pointer:C1124(Objet conteneur sous formulaire:K67:4); $colImagesAnchored[$index])
					End if 
				End if 
		End case 
		//: (WP Plage selection($WpDocument) ... VW : Ici on devrait être en capacité de tester les images "inline" mais je n'arrive pas à faire fonctionner cette partie :'(
	End if 
End if 

Erreur : tester le comportement
WP PictureSettings(Form:C1466.selection)



//$pictCol:=WP Get elements($range; wk type image)
//If ($pictCol.length>=1)
//$picture:=$pictCol[0]
//$form:=New object("picture"; $picture)
//$win:=Open form window("D_pictureSettings"; Movable form dialog box; Horizontally centered; Vertically centered)
//DIALOG("D_pictureSettings"; $form)
//End if 

