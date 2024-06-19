//%attributes = {"invisible":true}
// Méthode : WP_Print_Gesteam // DEV_VW
// 14/06/24 - 10:42
// Description: 
// Appelée lors d'un clique sur impression ou prévisualisation depuis la barre d'outils Gesteam
// --------
// Paramètres (entre [] si optionnel)
// - $1 : BOOLEEN (transféré à `WPTB_Gesteam_Print`)
//   Vrai -> Impression
//   Faux -> Prévisualisation
// ---
// Sortie
// - $0 : Rien
// --------
// [Remarques/Info supplémentaire]

C_BOOLEAN:C305($1)
C_BOOLEAN:C305($param_ok)
$param_ok:=True:C214

If (True:C214)  //Validation des paramètres
	If (Count parameters:C259#1)
		$param_ok:=False:C215
	End if 
End if 

If ($param_ok)  //Code de la méthode
	EXECUTE METHOD:C1007("WPTB_Gesteam_Print"; *; areaName; OBJECT Get pointer:C1124(Objet conteneur sous formulaire:K67:4); $1)
Else 
	ALERT:C41("Erreur dans les paramètres de la fonction \""+Current method name:C684+"\" De la barre d'outils Gesteam !")
End if 

