//%attributes = {}
C_OBJECT:C1216($1)
var $MergeOption : cs:C1710.MergeOptions

If (Count parameters:C259>=1)
	$MergeOption:=$1
Else 
	$MergeOption:=ObToolBarToObMergeOptions(Form:C1466)
End if 

If ($MergeOption=Null:C1517)
	OBJECT SET ENABLED:C1123(*; "btn_MergeOptions@"; False:C215)
Else 
	If (Not:C34(UI_isProtected))
		//Tout est actif avec filtre
		OBJECT SET ENABLED:C1123(*; "btn_MergeOptions@"; True:C214)
	End if 
	
	//Force les valeurs à l'écran
	MO_AddsHeadersFootersSections1:=$MergeOption.Get_AddsHeadersFootersSections1()
	MO_AddsHFSections2toN:=$MergeOption.Get_AddsHeadersFootersSections2toN()
	MO_MergeHeadersFooters:=$MergeOption.Get_MergeHeadersFooters()
	MO_HeaderFooterAutoHeight:=$MergeOption.Get_HeaderFooterAutoHeight()
	MO_KeepOnlySections1:=$MergeOption.Get_KeepOnlySections1()
	MO_KeepOnlyAllSectionsExist:=$MergeOption.Get_KeepOnlyAllSectionsExist()
	MO_ReverseFootersOrder:=$MergeOption.Get_ReverseFootersOrder()
	MO_AllowSectionsDiff:=Not:C34($MergeOption.Get_ProhibitsDifferentSections())
End if 

OBJECT SET ENABLED:C1123(*; "lbl_Aggregate"; False:C215)
OBJECT SET ENABLED:C1123(*; "btn_AggegateOptions_Default"; False:C215)
OBJECT SET ENABLED:C1123(*; "cb_AggegateRestatNumPages"; False:C215)