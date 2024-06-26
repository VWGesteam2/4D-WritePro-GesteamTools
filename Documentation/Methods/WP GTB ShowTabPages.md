<!-- WP BGT ShowTabPages( widget name ; toolbar name )
Méthode de la barre d'outils 4D Write Pro Gesteam
This method allows you to define the tabs to be displayed, as well as the order of the tabs. -->
```4d
WP GTB ShowTabPages( widget name ; toolbar name )
```

|Parameter|Type|In/Out|Description|
|---|---|---|---|
|widget name|String|In|Form object name|
|tab names|Collection|In|List of the tab names to display|


## Description

Méthode de la barre d'outils 4D Write Pro Gesteam

This method allows you to define the tabs to be displayed, as well as their order.

For toolbars, the following tabs are available:

* "Home"
* "Insert"
* "Margins"
* "Borders"
* "Images"
* "Printing"
* "Tables"
* "Spell"
* "Protection"
* "ImportExport"
* "FindAndReplace"
* "MergeAggregate"

For sidebars, the following tabs are available:

* "Fonts"
* "Alignments"
* "Tabulations"
* "Frames"
* "Sizes"
* "Backgrounds"
* "Expressions"
* "Bookmarks"
* "Stylesheets"
* "Tables"
* "Protection"
* "ImportExport"
* "FindAndReplace"
* "MergeAggregate"

## Example

Example for sidebars:

```code4d
$tabs:=New collection("ImportExport";"Fonts";"Alignments";"Tabulations")
WP GTB ShowTabPages ("WPwidget";$tabs)
```
