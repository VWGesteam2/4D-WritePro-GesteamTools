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
	
	APPEND MENU ITEM:C411($menuRef; "Ne fusionner que les sections existantes dans ce document")
	SET MENU ITEM METHOD:C982($menuRef; -1; "btnM_S_KeepOnlySections1")
	If ($MergeOptions.Get_KeepOnlySections1())
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{4})
	Else 
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{3})
	End if 
	If ($MergeOptions.Get_ProhibitsDifferentSections())
		DISABLE MENU ITEM:C150($menuRef; -1)
	End if 
	
	APPEND MENU ITEM:C411($menuRef; "Ne fusionner que les sections existantes dans tous les documents")
	SET MENU ITEM METHOD:C982($menuRef; -1; "btnM_S_KeepOnlyAllSectionsExist")
	If ($MergeOptions.Get_KeepOnlyAllSectionsExist())
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{4})
	Else 
		SET MENU ITEM ICON:C984($menuRef; -1; $cheminImage{3})
	End if 
	If ($MergeOptions.Get_ProhibitsDifferentSections())
		DISABLE MENU ITEM:C150($menuRef; -1)
	End if 
	
	APPEND MENU ITEM:C411($menuRef; "-")
	
	
	$choice:=Dynamic pop up menu:C1006($menuRef)
	
	RELEASE MENU:C978($menuRef)
Else 
	BEEP:C151
End if 