C_COLLECTION:C1488($_buttonNames)

C_LONGINT:C283($typeSelection)
C_LONGINT:C283($page)
C_LONGINT:C283($indexPictureSelect)

C_OBJECT:C1216($param)
C_COLLECTION:C1488($collection)
C_LONGINT:C283($cpt)

C_TEXT:C284($buttonName)

Case of 
		
	: (Form event code:C388=Sur chargement:K2:1)
		
		InitFontLists
		
		$param:=New object:C1471
		$param.formName:="toolbar"
		
		If (oForm=Null:C1517)
			oForm:=New object:C1471
		End if 
		
		// WITHOUT PREFIX !!! (tabBtn_ or tabRect_" managed in class)
		$_buttonNames:=New collection:C1472(\
			"Home"; \
			"Insert"; \
			"Margins"; \
			"Borders"; \
			"Images"; \
			"Printing"; \
			"Tables"; \
			"Spell"; \
			"Protection"; \
			"ImportExport"; \
			"FindAndReplace"; \
			"MergeAggregate")
		
		For each ($buttonName; $_buttonNames)
			OBJECT SET FONT STYLE:C166(*; "tabBtn_"+$buttonName; Gras:K14:2)  // Temporary to be sure they fit in space
		End for each 
		
		oForm.ToolbarTabs:=cs:C1710.Toolbar.new($_buttonNames; "TabArea")  // create CLASS
		
		//oForm.ToolbarTabs.setButtonSizes(50; 20)  // width (temp) and height (fixed)
		oForm.ToolbarTabs.setLabelMargins(6; 6)  //2px label margins
		oForm.ToolbarTabs.setButtonMargins(0; 0; 3; 0)  // left - top - right - bottom
		oForm.ToolbarTabs.pageIndexes:=New collection:C1472(1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12)
		
		oForm.ToolbarTabs.activate($_buttonNames[0])
		
		TB_GotoPage(oForm.ToolbarTabs.buttonNames[0])
		
		oForm.styleSheet:=New object:C1471
		oForm.styleSheet.btnType:=New collection:C1472(1; 0; 0; 0; 0; 0)  // buttons (1 : pushed)
		oForm.styleSheet.btnValue:=New collection:C1472(wk type paragraph:K81:191; wk type default:K81:190; wk type image:K81:192; wk type table:K81:222; wk type table row:K81:223; wk type table cell:K81:224)  // type of style sheet for each button
		
		
		// find and replace (Page 11)
		oForm.FR:=New object:C1471
		oForm.FR.find:=""
		oForm.FR.replace:=""
		oForm.FR.displayReplacements:=False:C215
		oForm.FR.occurences:=-1
		
		// ++see on timer
		
		
		//ACI0103661 report to v19R7
		oForm.eventCode:=-1  //  no need to test "undefined" see WP_SetListFont
		oForm.eventForcedCode:=-1  //  no need to test "undefined" see WP_SetListFont
		
		
		// temporarly
		OBJECT SET ENABLED:C1123(*; "ssType3"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType4"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType5"; False:C215)
		OBJECT SET ENABLED:C1123(*; "ssType6"; False:C215)
		
		If (Is macOS:C1572)
			OBJECT SET VISIBLE:C603(*; "mac_@"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "win_@"; True:C214)
		End if 
		
		
		oForm.skinAppliedMain:=UI_ApplySkin
		oForm.redrawTabs:=True:C214
		
		//Show empty or unsupported images.
		//Montrer les images vides ou non prises en charge.
		
		//tips
		OBJECT SET HELP TIP:C1181(*; "btn_visibleEmptyImages"; Get action info:C1442("visibleEmptyImages").title)
		OBJECT SET HELP TIP:C1181(*; "btn_displayAsSymbol"; Get action info:C1442("displayFormulaAsSymbol").title)
		
		If (Form:C1466#Null:C1517)
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
		End if 
		
	: (Form event code:C388=Sur changement de page:K2:54)
		
		UI_setApplyTo
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=Sur redimensionnement:K2:27)
		oForm.redrawTabs:=True:C214
		SET TIMER:C645(-1)
		
	: (Form event code:C388=Sur modif variable liée:K2:52)
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=Sur minuteur:K2:25)
		
		//oForm.ToolbarTabs.redraw()
		SET TIMER:C645(0)
		
		If (Form:C1466#Null:C1517)  //ACI0100560
			If (Not:C34(Undefined:C82(Form:C1466.selection)))  //ACI0100560
				If (Form:C1466.selection#Null:C1517)  //ACI0100560
					If (Not:C34(Undefined:C82(Form:C1466.selection.type)))  //ACI0100560
						
						$typeSelection:=Form:C1466.selection.type
						SetupLocalVariables  // in this widget, mainly for areaName and masterTable
						
						If (Not:C34(oForm.skinAppliedMain))
							oForm.skinAppliedMain:=UI_ApplySkin
						End if 
						
						
						If ($typeSelection#2)  // anchored picture
							
							WP_GetFormulas
							WP_GetFontInfo(Form:C1466.selection)  // font, size, weight, textcolor  (common method with font palette)
							
							
							$page:=FORM Get current page:C276(*)
							Case of 
									
								: ($page=1)
									WP_SetListFont(Form:C1466.selection)
									
								: ($page=5)  //  Images
									$param:=ObToolBarToDocument(Form:C1466)
									
									If ($param=Null:C1517)
										//-> par sécurité on vide le tableau
										ARRAY TEXT:C222(ImagesDocument; 0)
										ARRAY TEXT:C222(ImagesDocumentInfo; 0)
									Else 
										$collection:=WP Get elements:C1550($param; wk type image anchored:K81:248).extract("id")
										ARRAY TEXT:C222(ImagesDocument; $collection.length)
										ARRAY TEXT:C222(ImagesDocumentInfo; $collection.length)
										
										For ($cpt; 1; $collection.length)
											ImagesDocument{$cpt}:=$collection[$cpt-1]
											ImagesDocumentInfo{$cpt}:=$collection[$cpt-1]
										End for 
									End if 
									//Ce n'est pas une image qui est séléctionnée (donc rien de séléction dans la liste des images)
									ImagesDocument:=-1
									
								: ($page=9)
									WP_GetProtections(Form:C1466.selection)
									
								: ($page=11)  //  find & replace
									
									//UI_PaletteFindAndReplace
									WP_FR_InitOptions("toolbar")
									
									
									If (Length:C16(oForm.FR.find)>0)  //
										oForm.FR.occurences:=FR_Script("findAll")  //; oForm.FR.find)
									Else 
										oForm.FR.occurences:=-1
									End if 
									
									
							End case 
						Else   //$typeSelection=2 // anchored picture
							If (FORM Get current page:C276(*)=5)  //  Images (sinon c'est inutile de faire le job)
								$param:=ObToolBarToDocument(Form:C1466)
								
								If ($param=Null:C1517)
									//-> par sécurité on vide le tableau
									ARRAY TEXT:C222(ImagesDocument; 0)
									ARRAY TEXT:C222(ImagesDocumentInfo; 0)
								Else 
									$collection:=WP Get elements:C1550($param; wk type image anchored:K81:248).extract("id")
									ARRAY TEXT:C222(ImagesDocument; $collection.length)
									ARRAY TEXT:C222(ImagesDocumentInfo; $collection.length)
									
									For ($cpt; 1; $collection.length)
										ImagesDocument{$cpt}:=$collection[$cpt-1]
										ImagesDocumentInfo{$cpt}:=$collection[$cpt-1]
									End for 
								End if 
								If ($typeSelection=2)
									$indexPictureSelect:=Find in array:C230(ImagesDocument; Form:C1466.selection.id)
									
									If ($indexPictureSelect>0)
										ImagesDocument:=$indexPictureSelect
									Else 
										ALERT:C41("L'image id=["+Form:C1466.selection.id+"] n'a pas été trouvée dans la liste des images")
									End if 
								Else 
									ImagesDocument:=-1
								End if 
							End if 
							
						End if 
					Else 
						ImagesDocument:=-1
						// WP_GetProtection  // page 2
					End if 
				Else 
					ImagesDocument:=-1
				End if 
			Else 
				ImagesDocument:=-1
			End if 
		Else 
			ImagesDocument:=-1
		End if 
		
		UI_Toolbar  // will call UI_PaletteFindAndReplace
		
	Else 
		
		ALERT:C41("Event not taken into account")
		
End case 

