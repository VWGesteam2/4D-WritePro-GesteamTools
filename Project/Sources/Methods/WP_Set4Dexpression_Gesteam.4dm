//%attributes = {"invisible":true}
// Méthode : WP_Gesteam_Set4Dexpression // VW
// 30/05/24 - 09:11
// Description: 
// --------
// Paramètres (entre [] si optionnel)
// - Aucun
// ---
// Sortie
// - $0 : TYPE/Rien
//   Rien
// --------
// Appelé depuis la tool bar modifié pour Gesteam

// Toutes les infos supplémentaire à donner en priorité aux prochains développeurs
// N'apparaitra pas dans les infos bulles de la méthode

If (False:C215)  //Exemples et tests
	//Tous les tests unitaires et exemples d'utilisation de la méthode
	
End if 

////Debut du mode Trace
// A voir : souhaite t'on ajouter des traces ?
// - si oui : partager les méthodes de l'applicatif Gesteam et cabler les appels avec `EXÉCUTER MÉTHODE`
// - sinon : bah on laisse comme ça
//DBG_Trace_Method(Nom méthode courante; 1; Nombre de paramètres)
//DBG_Trace_Method_Params_...($1)
//Si (Nombre de paramètres>=2)
//DBG_Trace_Method_Params_...
//Fin de si 

If (True:C214)  //Code de la méthode
	C_OBJECT:C1216($o_plage_selection)
	C_VARIANT:C1683($ignoreReturn)
	If (areaName#"")
		$o_plage_selection:=WP Selection range:C1340(*; areaName)
	Else 
		$o_plage_selection:=New object:C1471()
	End if 
	
	EXECUTE METHOD:C1007("WPTB_Gesteam_Inser_Expression"; $ignoreReturn; $o_plage_selection)
End if 

////Fin du mode Trace
//DBG_Trace_Method(Nom méthode courante; 0)

