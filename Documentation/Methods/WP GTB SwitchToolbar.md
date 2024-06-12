<!-- This method allows switching between toolbar interfaces. -->
```4d
WP GTB SwitchToolbar( widget name ; toolbar name )
```
| Parameter | Type   | in/out | Description |
| --------- | ------ | ------ | ----------- |
| widget name    | String | in     | Form object name    |
| toolbar name   | String | in     | Name of toolbar: Toolbar1 or Toolbar2 |

## Description

Méthode de la barre d'outils Gesteam 4D Write Pro.

This method allows switching between toolbar interfaces.

## Example
```4d
WP GTB SwitchToolbar ("WParea" ; "Toolbar1")
WP GTB SwitchToolbar ("WParea" ; "Toolbar2")
```
