//%attributes = {"invisible":true,"shared":true}
// this method is executed in the main form context

C_TEXT:C284($1; $widgetName)
C_TEXT:C284($2; $areaName)
C_OBJECT:C1216($3; $skin)

C_BOOLEAN:C305($send)
C_OBJECT:C1216($WP_object)  // variable used manage to the 4D WritePro Widget
C_POINTER:C301($widgetPtr; $areaPtr)  // Pointers on the area and widget
C_POINTER:C301($p)
C_TEXT:C284($areaName; $widgetName)  // "4DWritePro area" and "4DWritePro widget" object names

Case of 
	: (Count parameters:C259=1)
		
		$widgetName:=$1
		$p:=OBJECT Get pointer:C1124(Objet nommé:K67:5; $widgetName)
		If (Not:C34(Is nil pointer:C315($p)))
			$p->:=$p->
		End if 
		
	: (Count parameters:C259>=2)
		
		$widgetName:=$1
		$areaName:=$2
		
		//-----------------------------------------------------------
		$areaPtr:=OBJECT Get pointer:C1124(Objet nommé:K67:5; $areaName)
		$widgetPtr:=OBJECT Get pointer:C1124(Objet nommé:K67:5; $widgetName)
		
		
		If ((Not:C34(Is nil pointer:C315($areaPtr))) & (Not:C34(Is nil pointer:C315($widgetPtr))))
			If (Not:C34(Undefined:C82($areaPtr->)))
				If (Type:C295($areaPtr->)=Est un objet:K8:27)
					If (Not:C34(OB Is empty:C1297($areaPtr->)))  //
						
						$WP_object:=New object:C1471
						
						$WP_object.selection:=WP Selection range:C1340(*; $areaName)
						$WP_object.areaPointer:=$areaPtr
						$WP_object.areaName:=$areaName  //mandatory to use ST Commands
						$WP_object.masterTable:=Current form table:C627  // or a pointer or any other table (for formula)
						$WP_object.spellCheck:=OBJECT Get auto spellcheck:C1174(*; $areaName)  // true or false according to the setting
						
						$WP_object.enterable:=OBJECT Get enterable:C1067(*; $WP_object.areaName)
						$WP_object.keyboard:=OBJECT Get keyboard layout:C1180(*; $WP_object.areaName)
						
						Case of 
							: (Form event code:C388=Sur perte focus:K2:8)
								$WP_object.focus:=False:C215  // anticipate lost of focus to disable interface
							: (Form event code:C388=Sur gain focus:K2:7)
								$WP_object.focus:=True:C214
						End case 
						
						If (Count parameters:C259>=3)
							$skin:=$3
							$WP_object.skin:=$skin
						End if 
						
						$send:=True:C214
						Case of 
							: (Form event code:C388=Sur chargement:K2:1)
							: (Form event code:C388=Sur après modification:K2:43)
							: (Form event code:C388=Sur nouvelle sélection:K2:29)
							: (Form event code:C388=Sur gain focus:K2:7)
							: (Form event code:C388=Sur perte focus:K2:8)
							: (Form event code:C388=Sur clic:K2:4)  // when called from a button !
							Else 
								$send:=False:C215
						End case 
						
						If ($send)
							$widgetPtr->:=$WP_object
						End if 
						
					Else 
						// [compiled mode : page 2 of form (during on load)] OR [interpreted mode with dynamic var]
					End if 
				Else 
					// bad type… programming error
				End if 
			Else 
				// Interpreted mode and page 2
			End if 
		Else 
			// Either $areaName or $widgetName is not well defined
		End if 
		
End case 

