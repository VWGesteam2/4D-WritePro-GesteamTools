//%attributes = {"invisible":true}
//#DECLARE($scope : Integer)  // 0  = all document, 1 = selection only
var $1; $scope : Integer
If (Count parameters:C259>=1)
	$scope:=$1
Else 
	$scope:=0
End if 

If ($scope=0)  // full document
	WP COMPUTE FORMULAS:C1707(Form:C1466.selection.owner)
Else 
	WP COMPUTE FORMULAS:C1707(Form:C1466.selection)
End if 
