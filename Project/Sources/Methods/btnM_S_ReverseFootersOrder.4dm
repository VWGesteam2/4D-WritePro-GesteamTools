//%attributes = {}
var $mergeOptions : cs:C1710.MergeOptions
$mergeOptions:=ObToolBarToObMergeOptions(Form:C1466)
$mergeOptions.Switch_ReverseFootersOrder()
SetMergeOptionFormOb(Form:C1466; $mergeOptions)