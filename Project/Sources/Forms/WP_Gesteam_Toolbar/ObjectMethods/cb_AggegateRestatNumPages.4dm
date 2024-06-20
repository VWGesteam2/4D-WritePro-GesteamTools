C_OBJECT:C1216($Currentsection)
TRACE:C157
//A UTILISER IMPERATIVEMENT : "AggregateOptions" pour les options d'aggregation
$Currentsection:=WP Get section:C1581(Form:C1466.selection)
If (AggegateRestatNumPages)
	WP RESET ATTRIBUTES:C1344($Currentsection; wk page first number:K81:271)
Else 
	WP SET ATTRIBUTES:C1342($Currentsection; wk page first number:K81:271; 50)
End if 