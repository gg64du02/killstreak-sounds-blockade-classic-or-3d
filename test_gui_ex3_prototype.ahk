Gui, Add, Tab2,, Desktop|Game settings|Information  ; Tab2 vs. Tab requires [v1.0.47.05+].

Gui, Add, Text,, This AHK is supposed to help`n get killstreak sounds when playing Blockade 3D
Gui, Add, Text,, Please check the Game settings resolution`n and select the right resolution
Gui, Add, Text,, When done, just click Launch`n (a H icon would be in the system tray)
Gui, Tab, 2
Gui, Add, Checkbox, vMyCheckboxSameReso gCheckbx checked, Different resolution
Gui, Add, Text,, Please choose the resolution
Gui Add, DDL, vcbx w200 hwndhcbx, 1280x600||1280x720||1280x768||1280x800||1280x960||1280x1024||1360x768||1366x768||1400x1050||1440x900||1600x900||1680x1050||1920x1080
Gui, Tab, 3
Gui, Add, Text,, CREDITS: freely created by gg64du02 (Steam)`nCREDITS: idea and sounds by [D]arktooth (Steam) with AutoHotKey`n
Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
Gui, Show
return

ButtonOK:
GuiClose:
GuiEscape:
Gui, Submit  ; Save each control's contents to its associated variable.
MsgBox You entered:`n%MyCheckbox%`n%MyRadio%`n%MyEdit%
ExitApp


Checkbx:
guicontrolget, MyCheckboxSameReso
guicontrol, enable%MyCheckboxSameReso%, cbx
return