Class constructor
	var $1 : Integer
	If (Count parameters:C259>=1)
		This:C1470.optionsValue:=$1
	Else 
		This:C1470.SetOptionValueDefault()
	End if 
	
	//---------------------------------------------
	//Valeur des options de fusions
	//------------
Function GetOptionValue
	var $0 : Integer
	$0:=This:C1470.optionsValue
	
Function SetOptionValue
	var $1 : Integer
	This:C1470.optionsValue:=$1
	
Function SetOptionValueDefault
	This:C1470.optionsValue:=0
	
	//---------------------------------------------
	//Interdi le nombre de section différentes entre les documents
	//------------
Function Get_HeaderFooterAutoHeight
	var $0 : Boolean
	$0:=(This:C1470.optionsValue & 1)=0  //1 Non présent => option active
	
Function Set_HeaderFooterAutoHeight
	var $1 : Boolean
	var $OptActive : Boolean
	$OptActive:=This:C1470.Get_HeaderFooterAutoHeight()
	Case of 
		: ($1 & Not:C34($OptActive))  //A activer et non actif
			This:C1470.optionsValue:=This:C1470.optionsValue-1  //Pour activer il faut supprimer le 1
		: (Not:C34($1) & $OptActive)  //A désactiver et actif
			This:C1470.optionsValue:=This:C1470.optionsValue+1  //Pour désactiver il faut ajouter le 1
	End case 
	
Function Switch_HeaderFooterAutoHeight
	This:C1470.Set_HeaderFooterAutoHeight(Not:C34(This:C1470.Get_HeaderFooterAutoHeight()))
	
	//---------------------------------------------
	//Interdi le nombre de section différentes entre les documents
	//------------
Function Get_ProhibitsDifferentSections
	var $0 : Boolean
	$0:=(This:C1470.optionsValue & 2)#0  //2 Non présent => option interdition active
	
Function Set_ProhibitsDifferentSections
	var $1 : Boolean
	var $OptActive : Boolean
	$OptActive:=This:C1470.Get_ProhibitsDifferentSections()
	Case of 
		: ($1 & Not:C34($OptActive))  //A activer et non actif
			This:C1470.optionsValue:=This:C1470.optionsValue+2  //Pour activer il faut ajouter
		: (Not:C34($1) & $OptActive)  //A désactiver et actif
			This:C1470.optionsValue:=This:C1470.optionsValue-2  //Pour désactiver il faut supprimer
	End case 
	
Function Switch_ProhibitsDifferentSections
	This:C1470.Set_ProhibitsDifferentSections(Not:C34(This:C1470.Get_ProhibitsDifferentSections()))
	
	//---------------------------------------------
	//Désactiver la copie des entête et pieds de page
	//------------
Function Get_MergeHeadersFooters
	var $0 : Boolean
	$0:=(This:C1470.optionsValue & 4)=0  //4 Non présent => option interdition de copie des entêtes et pieds de pages
	
Function Set_MergeHeadersFooters
	var $1 : Boolean
	var $OptActive : Boolean
	$OptActive:=This:C1470.Get_MergeHeadersFooters()
	Case of 
		: ($1 & Not:C34($OptActive))  //A activer et non actif
			This:C1470.optionsValue:=This:C1470.optionsValue-4  //Pour activer il faut supprimer le 1
		: (Not:C34($1) & $OptActive)  //A désactiver et actif
			This:C1470.optionsValue:=This:C1470.optionsValue+4  //Pour désactiver il faut ajouter le 1
	End case 
	
Function Switch_MergeHeadersFooters
	This:C1470.Set_MergeHeadersFooters(Not:C34(This:C1470.Get_MergeHeadersFooters()))
	
	//---------------------------------------------
	//Désactiver l'inversion de l'ordre des pieds de pages
	//------------
Function Get_ReverseFootersOrder
	var $0 : Boolean
	$0:=(This:C1470.optionsValue & 8)=0  //8 Non présent => option active
	
Function Set_ReverseFootersOrder
	var $1 : Boolean
	var $OptActive : Boolean
	$OptActive:=This:C1470.Get_ReverseFootersOrder()
	Case of 
		: ($1 & Not:C34($OptActive))  //A activer et non actif
			This:C1470.optionsValue:=This:C1470.optionsValue-8  //Pour activer il faut supprimer le 1
		: (Not:C34($1) & $OptActive)  //A désactiver et actif
			This:C1470.optionsValue:=This:C1470.optionsValue+8  //Pour désactiver il faut ajouter le 1
	End case 
	
Function Switch_ReverseFootersOrder
	This:C1470.Set_ReverseFootersOrder(Not:C34(This:C1470.Get_ReverseFootersOrder()))
	
	//---------------------------------------------
	//Désactiver la répétion des entêtes et pieds sur les sections manquantes des document 2 à n
	//------------
Function Get_AddsHeadersFootersSections2toN
	var $0 : Boolean
	$0:=(This:C1470.optionsValue & 16)=0  //16 Non présent => option active
	
Function Set_AddsHeadersFootersSections2toN
	var $1 : Boolean
	var $OptActive : Boolean
	$OptActive:=This:C1470.Get_AddsHeadersFootersSections2toN()
	Case of 
		: ($1 & Not:C34($OptActive))  //A activer et non actif
			This:C1470.optionsValue:=This:C1470.optionsValue-16  //Pour activer il faut supprimer le 1
		: (Not:C34($1) & $OptActive)  //A désactiver et actif
			This:C1470.optionsValue:=This:C1470.optionsValue+16  //Pour désactiver il faut ajouter le 1
	End case 
	
Function Switch_AddsHeadersFootersSections2toN
	This:C1470.Set_AddsHeadersFootersSections2toN(Not:C34(This:C1470.Get_AddsHeadersFootersSections2toN()))
	
	//---------------------------------------------
	//Désactiver la répétion des entêtes et pieds sur les sections manquantes du document 1 (document courent)
	//------------
Function Get_AddsHeadersFootersSections1
	var $0 : Boolean
	$0:=(This:C1470.optionsValue & 32)=0  //16 Non présent => option active
	
Function Set_AddsHeadersFootersSections1
	var $1 : Boolean
	var $OptActive : Boolean
	$OptActive:=This:C1470.Get_AddsHeadersFootersSections1()
	Case of 
		: ($1 & Not:C34($OptActive))  //A activer et non actif
			This:C1470.optionsValue:=This:C1470.optionsValue-32  //Pour activer il faut supprimer le 1
		: (Not:C34($1) & $OptActive)  //A désactiver et actif
			This:C1470.optionsValue:=This:C1470.optionsValue+32  //Pour désactiver il faut ajouter le 1
	End case 
	
Function Switch_AddsHeadersFootersSections1
	This:C1470.Set_AddsHeadersFootersSections1(Not:C34(This:C1470.Get_AddsHeadersFootersSections1()))
	
	//---------------------------------------------
	//Ne fusionner que les sections existantes dans le doc 1 (mutuellement exclusif avec l'option "KeepOnlySections2toN")
	//------------
Function Get_KeepOnlySections1
	var $0 : Boolean
	$0:=(This:C1470.optionsValue & 64)#0  //64 Présent => option active
	
Function Set_KeepOnlySections1
	var $1 : Boolean
	var $OptActive : Boolean
	$OptActive:=This:C1470.Get_KeepOnlySections1()
	Case of 
		: ($1 & Not:C34($OptActive))  //A activer et non actif
			This:C1470.optionsValue:=This:C1470.optionsValue+64  //Pour activer il faut ajouter
			//Mutuellement exclusif avec l'option "KeepOnlySections2toN"
			If (This:C1470.Get_KeepOnlyAllSectionsExist())
				This:C1470.optionsValue:=This:C1470.optionsValue-128
			End if 
			
		: (Not:C34($1) & $OptActive)  //A désactiver et actif
			This:C1470.optionsValue:=This:C1470.optionsValue-64  //Pour désactiver il faut supprimer
	End case 
	
Function Switch_KeepOnlySections1
	This:C1470.Set_KeepOnlySections1(Not:C34(This:C1470.Get_KeepOnlySections1()))
	
	//---------------------------------------------
	//Ne fusionner que les sections existantes dans tous les documents (mutuellement exclusif avec l'option KeepOnlySections1)
	//------------
Function Get_KeepOnlyAllSectionsExist
	var $0 : Boolean
	$0:=(This:C1470.optionsValue & 128)#0  //64 Présent => option active
	
Function Set_KeepOnlyAllSectionsExist
	var $1 : Boolean
	var $OptActive : Boolean
	$OptActive:=This:C1470.Get_KeepOnlyAllSectionsExist()
	Case of 
		: ($1 & Not:C34($OptActive))  //A activer et non actif
			This:C1470.optionsValue:=This:C1470.optionsValue+128  //Pour activer il faut ajouter
			//Mutuellement exclusif avec l'option "KeepOnlySections2toN"
			If (This:C1470.Get_KeepOnlySections1())
				This:C1470.optionsValue:=This:C1470.optionsValue-64
			End if 
			
		: (Not:C34($1) & $OptActive)  //A désactiver et actif
			This:C1470.optionsValue:=This:C1470.optionsValue-128  //Pour désactiver il faut supprimer
	End case 
	
Function Switch_KeepOnlyAllSectionsExist
	This:C1470.Set_KeepOnlyAllSectionsExist(Not:C34(This:C1470.Get_KeepOnlyAllSectionsExist()))