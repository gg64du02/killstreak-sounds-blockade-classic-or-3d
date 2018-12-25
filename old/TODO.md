# killstreak-sounds-blockade3d

;TODO: create a new script for the global update (the old one no longer works)
	
;READ ME DEV

;-DONE 01:17 03/09/2017  works on the (EC7) in 1920*1080
;-DONE check positions and colors sound reading.... (see READZONEfileAppendV0.4.ahk)
;-DONE issue the sounds once per life
;-DONE change the binding key for a less annoying one.

;-DONE Do a reverse engineering on the UI in the generated dll from the Unity engine
; to know what is the proper formula for position the number we are looking for

;  (approximate position of the numbers in 1920*1080 : 960-384~ )
;-DONE: make a multiresolution capable script: fix the performance problem
;-DONE: fix the perf: problem: with option (helps but nto enough)
:-DONE: fix the perf: fitter variable declaration (combinaison global and static)

;-DONE: check why 3kill trigger isntead of 2kill trigger
;-DONE: add the auto detect for resolution


;NOT DONE/because unwise (aka bring complexity to the END USER)
;-TODO/unwise Do a menu (default and advanced)
;====================================================================
;-TODO/unwise interpolation resolution w/ mutliresolution support
;-TODO/unwise add female male voices unreal tournament
;-TODO/unwise test GetPixelPosition on 1280*800 with a desktop resolution 1920*1080

;-TODO/unwise modify the guessNumber() to use image to guess it more easily (from
;a programming Point of View). To allow an extended range of numbers.
;====================================================================


;Tips on how to implement:
;It is crucial you get the right color and position, capture as .bmp with Fraps if you can
;and open it in GIMP. To get the pixels' position use the window spy delivered with AHK or
;use Gimp

;-with window (spy) (w/ AHK) put the task bar on the left or right to gain access to the low part
;of the full 1080*1920

;-if you don't have anything else than Steam to take picture, use a bind (into a AHK script) with
;the middle mouse click: MButton::F10
;i.e. it will be easier for you to take useful screenshots between kills

;DO NOT DO:
;use the windows preview of windows 10 (which seems like it is doing approximations
;maybe for a faster display of the image ?)
;-use screenshots from Steam for color (even in not compressed, it is .png, so EPIC FAIL...)

;DONT NEED IT clear the output log in autohot keys (memories issues might occurs)
;DONT NEED IT CoordMode

;Tweak (between EC7 and EC8)
;Added 7 killsound
;improved "manual", tips and tricks for AHK development
;fixed sound repeating