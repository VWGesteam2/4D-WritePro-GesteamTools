//%attributes = {}
var $mergeOptions : cs:C1710.MergeOptions
$mergeOptions:=ObToolBarToObMergeOptions(Form:C1466)
$mergeOptions.Switch_AddsHeadersFootersSections2toN()
SetMergeOptionFormOb(Form:C1466; $mergeOptions)