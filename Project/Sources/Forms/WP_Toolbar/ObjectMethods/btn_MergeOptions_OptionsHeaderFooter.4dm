C_TEXT:C284($menuRef; $choice)
ARRAY TEXT:C222($cheminImage; 4)
var $MergeOptions : cs:C1710.MergeOptions
$MergeOptions:=ObToolBarToObMergeOptions(Form:C1466)
If ($MergeOptions#Null:C1517)
	$cheminImage{1}:="Path:/RESOURCES/Images/MenuIcons/cb_uncheck_24_1.png"  //Checkbox uncheck
	$cheminImage{2}:="Path:/RESOURCES/Images/MenuIcons/cb_checked_24_1.png"  //Checkbox checked
	$cheminImage{3}:="Path:/RESOURCES/Images/MenuIcons/rb_uncheck_24_1.png"  //Radio bouton uncheck
	$cheminImage{4}:="Path:/RESOURCES/Images/MenuIcons/rb_checked_24_1.png"  //Radio bouton checked
	
	$menuRef:=Create menu:C408
	
	APPEND MENU ITEM:C411($menuRef; "(<I<B Gestion avancée des entêtes et pieds de pages")
	
	APPEND MENU ITEM:C411($menuRef; "-")
	
	APPEND MENU ITEM:C411($menuRef; "Activer le redimensionnement automatique des entêtes et des pieds")
	SET MENU ITEM METHOD:C982($menuRef; -1; "btnM_S_HFAutoHeight")
	If ($MergeOptions.Get_HeaderFooterAutoHeight())
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{2})
	Else 
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{1})
	End if 
	
	APPEND MENU ITEM:C411($menuRef; "-")
	
	APPEND MENU ITEM:C411($menuRef; "Inverser de l'ordre des pieds de pages")
	SET MENU ITEM METHOD:C982($menuRef; -1; "btnM_S_ReverseFootersOrder")
	If ($MergeOptions.Get_ReverseFootersOrder())
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{2})
	Else 
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{1})
	End if 
	If (Not:C34($MergeOptions.Get_MergeHeadersFooters()))
		DISABLE MENU ITEM:C150($menuRef; -1)
	End if 
	
	APPEND MENU ITEM:C411($menuRef; "-")
	
	APPEND MENU ITEM:C411($menuRef; "Répéter les derniers entêtes et pieds sur les sections manquantes de ce document")
	//Méfiance le code de l'option désactive ça ;)
	SET MENU ITEM METHOD:C982($menuRef; -1; "btnM_S_AddsHFSection1")
	If ($MergeOptions.Get_AddsHeadersFootersSections1())
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{2})
	Else 
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{1})
	End if 
	If ($MergeOptions.Get_ProhibitsDifferentSections() | $MergeOptions.Get_KeepOnlyAllSectionsExist())
		DISABLE MENU ITEM:C150($menuRef; -1)
	End if 
	
	APPEND MENU ITEM:C411($menuRef; "Répéter les entêtes et pieds sur les sections manquantes des documents suivants")
	//Méfiance le code de l'option désactive ça ;)
	SET MENU ITEM METHOD:C982($menuRef; -1; "btnM_S_AddsHFSections2toN")
	If ($MergeOptions.Get_AddsHeadersFootersSections2toN())
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{2})
	Else 
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{1})
	End if 
	If ($MergeOptions.Get_ProhibitsDifferentSections() | Not:C34($MergeOptions.Get_MergeHeadersFooters() | $MergeOptions.Get_KeepOnlyAllSectionsExist()))
		DISABLE MENU ITEM:C150($menuRef; -1)
	End if 
	
	$choice:=Dynamic pop up menu:C1006($menuRef)
	
	RELEASE MENU:C978($menuRef)
Else 
	BEEP:C151
End if 