//%attributes = {}
// Méthode : ObToolBarToDocument // DEV_VW
// 17/06/24 - 10:15
// Description: 
//  Retourne depuis un objet From de la barre d'outils Gesteam le document WP lié
// --------
// Paramètres (entre [] si optionnel)
// - $1 : OBJET (Form depuis une ToolBar Gesteam)
// ---
// Sortie
// - $0 : OBJET
//   Null ou l'objet WP
// --------
// [Remarques/Info supplémentaire]

// Toutes les infos supplémentaires à donner en priorité aux prochains développeurs
// N'apparaitra pas dans les infos bulles de la méthode

C_OBJECT:C1216($1)
C_OBJECT:C1216($0)
$0:=Null:C1517

Case of 
	: ($1=Null:C1517)
	: (Not:C34(OB Is defined:C1231($1; "areaPointer")))
	Else 
		Case of 
			: (OB Get type:C1230($1; "areaPointer")=Est un pointeur:K8:14)
				Case of 
					: (Is nil pointer:C315($1.areaPointer))
					: (Type:C295($1.areaPointer->)#Est un objet:K8:27)
					: (OB Is empty:C1297($1.areaPointer->))
					Else 
						$0:=$1.areaPointer->
				End case 
			: (OB Get type:C1230(Form:C1466; "areaPointer")=Objet type zone plug in:K79:39)
				
				$0:=$1.areaPointer->
		End case 
End case 