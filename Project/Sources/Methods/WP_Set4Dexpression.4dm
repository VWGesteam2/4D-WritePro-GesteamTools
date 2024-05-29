//%attributes = {"invisible":true}
C_OBJECT:C1216($o_plage_selection)
C_VARIANT:C1683($ignoreReturn)
If (areaName#"")
	$o_plage_selection:=WP Selection range:C1340(*; areaName)
Else 
	$o_plage_selection:=New object:C1471()
End if 

EXECUTE METHOD:C1007("WP_Gesteam_Inser_Expression"; $ignoreReturn; $o_plage_selection)
