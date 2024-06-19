//%attributes = {}
var $mergeOptions : cs:C1710.MergeOptions
$mergeOptions:=ObToolBarToObMergeOptions(Form:C1466)
$mergeOptions.Switch_KeepOnlySections1()
SetMergeOptionFormOb(Form:C1466; $mergeOptions)