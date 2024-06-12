<!-- This method updates the widget when modifications have been made. -->
```4d
WP GTB UpdateWidget( widget name {; area name {;skin}})
```
| Parameter   | Type   | in/out | Description |
| ---------   | ------ | ------ | ----------- |
| widget name | String | in     | Form object name    |
| area name   | String | in     | area object name    |
| {skin}      | Object | in     | skin variable       |

## Description

Méthode de la barre d'outils Gesteam 4D Write Pro.

This method updates the widget when modifications have been made
- by programming (only one parameter needed)
- using the area (two parameters needed)
-- a skin can be sent when using palettes (right widget)

## Example
```4d
WP GTB UpdateWidget ("WPtoolbar";"WParea")
```
