
ListLines Off

	;making the 1920*1080 (actual desktop resolution) set as 1024*768 (in game settings resolution)

	;===========PLEASE SET ME UP===========
	SysGet, VirtualScreenWidth, 78
	SysGet, VirtualScreenHeight, 79
	
	global screenWidth   := VirtualScreenWidth
	global screenHeight := VirtualScreenHeight
	
	;=======================================================================
	;=========================GUI===========================================
	;=======================================================================
	Gui, Add, Tab2,, Desktop|Game settings|Information  ; Tab2 vs. Tab requires [v1.0.47.05+].
	Gui, Add, Text,, This AHK is supposed to help`n get killstreak sounds when playing Blockade 3D
	Gui, Add, Text,, Make sure you are playing with one screen and fullscreen
	Gui, Add, Text,, Please check the Game settings resolution`n and select the right resolution
	Gui, Add, Text,, When done, just click Launch`n (a H icon would be in the system tray)
	Gui, Add, Text,, Detected desktop resolution:%screenWidth%x%screenHeight%
	Gui, Tab, 2
	Gui, Add, Checkbox, vMyCheckboxSameReso gCheckbx checked, Different resolution
	Gui, Add, Text,, Please choose the resolution
	Gui Add, DDL, vcbx w200 hwndhcbx gDDLsubroutine, 1024x768||1280x600||1280x720||1280x768||1280x800||1280x960||1280x1024||1360x768||1366x768||1400x1050||1440x900||1600x900||1680x1050||1920x1080
	Gui, Tab, 3
	Gui, Add, Text,, CREDITS: freely created by gg64du02 (Steam)`nCREDITS: idea and sounds by [D]arktooth (Steam) with AutoHotKey`n
	Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
	Gui, Add, Button, default xm, OK  ; xm puts it at the bottom left corner.
	Gui, Show
	return

	Checkbx:
	guicontrolget, MyCheckboxSameReso
	guicontrol, enable%MyCheckboxSameReso%, cbx
	return
	
	
	ButtonOK:
	btnOK:=1
	GuiClose:
	GuiEscape:
	Gui, Submit  ; Save each control's contents to its associated variable.
	;MsgBox You entered:`n%MyCheckbox%`n%MyRadio%`n%MyEdit%
	;ExitApp
	
	DDLsubroutine:
	Gui, Submit,NoHide  ; Save each control's contents to its associated variable.
	;debugging purpose
	;MsgBox lol1
	;MsgBox % SubStr("123abc789", 4, 3)
	;FoundPos := RegExMatch("xxxabc123xyz", "abc.*xyz")  
	tmpxPostion := RegExMatch(cbx, "x")  
	;Almost useless since the x would be always? at 5 (unless the dev allow resolution like 640*480)
	;debugging purpose
	;MsgBox tmpxPostion: %tmpxPostion%
	selectedWidth := SubStr(cbx,1,4)
	;debugging purpose
	;MsgBox selectedWidth: %selectedWidth%
	
	selectedHeight := SubStr(cbx,6,4)
	;debugging purpose
	;MsgBox selectedHeight: %selectedHeight%
	
	selectedScreenRatio := selectedWidth / selectedHeight
	;debugging purpose
	MsgBox selectedScreenRatio: %selectedScreenRatio%
	
	nativeDesktopRatio := screenWidth / screenHeight
	
	;bug in either the game on the unity engine
	if(cbx="1024x768"){
		;debugging purpose
		;MsgBox lol2
		;the result would be 1440x1080
		expectedWidth := 1440
		expectedHeight := 1080
	} else {
		;all other resolution and upscale properly
		;if the native screen ratio is wider than the selected screen
		if(nativeDesktopRatio>selectedScreenRatio){
			;DONE
			;debugging purpose
			;MsgBox lol3
			;so the screen would be all the way spread verticaly
			expectedHeight := screenHeight
			;width would be calculated
			expectedWidth := screenHeight * selectedWidth / selectedHeight
			;MsgBox expectedWidth: %expectedWidth%
			
		
		} else {
			;DONE
			;debugging purpose
			;MsgBox lol4
			;so the screen would be all the way spread horizontaly
			expectedWidth := screenWidth
			;height would be calculated
			expectedHeight := screenWidth * selectedHeight / selectedWidth
			;MsgBox expectedHeight: %expectedHeight%
		
		}
		
	}
	
	;expectedWidthTotalOn :=0
	;expectedHeightTotalOn :=0
	
	;check notes_equation.txt
	;expectedWidthTotalOn := ( 0.5 * selectedWidth + 106 ) 
	;expectedHeightTotalOn := ( 1 * selectedHeight - 230 ) 
	;1109 in 1920x1080 w/ 1024x768
	;expectedWidthTotalOn := ( 0.5 * selectedWidth + 106 )  * (expectedWidth / selectedWidth)
	expectedWidthTotalOn := ( 0.5 * screenWidth) + (106 )  * (expectedWidth / selectedWidth)
	expectedHeightTotalOn := ( 1 * selectedHeight - 230 )  * (expectedHeight / selectedHeight)
	
	;MsgBox expectedWidthTotalOn: %expectedWidthTotalOn%
	;MsgBox expectedHeightTotalOn: %expectedHeightTotalOn%
	
	
	;check notes_equation.txt
	;expectedWidthKillerTagTopRight := ( 0.5 * selectedWidth) + (-300 + 2)
	;expectedHeightKillerTagTopRight := ( 1 * selectedHeight - 130 + 3 )  
	;expectedWidthKillerTagTopRight := 
	;expectedWidthKillerTagTopRight := ( 0.5 * selectedWidth) + (-300 + 2)  * (expectedWidth / selectedWidth) * (expectedWidth / selectedWidth)
	expectedWidthKillerTagTopRight := ( 0.5 * screenWidth) + (-300 + 2)  * (expectedWidth / selectedWidth)
	expectedHeightKillerTagTopRight := ( 1 * selectedHeight - 130 + 3 )  * (expectedHeight / selectedHeight)
	
	MsgBox expectedWidthKillerTagTopRight: %expectedWidthKillerTagTopRight%
	MsgBox expectedHeightKillerTagTopRight: %expectedHeightKillerTagTopRight%
	
	
	
	
	;expected resolution
	;MsgBox expected resolution: %expectedWidth%x%expectedHeight%
	
	;debugging purpose
	;if(cbx="1280x720")
	;	MsgBox lol2
		
	
	;MsgBox MyCheckboxSameReso: %MyCheckboxSameReso%
	if( NOT(btnOK=1) ){
		return
	}


	;=======================================================================
	;=======================================================================
	;=======================================================================
	
	;DONE insert GUI around here
	;TODO test the screen ratio to decide how to do the cross multiplication
	

	;TODO: need to be speed up way more
	;TODO: need to add rejection of false detection on isTotalOn
	
	nativeDesktopRatio := screenWidth / screenHeight
	
	;MsgBox MyCheckboxSameReso: %MyCheckboxSameReso%
	
	;TODO: debugging purpose
	MsgBox nativeDesktopRatio: %nativeDesktopRatio%


	;initialization for uniq killstreak's sounds triggering per life
	2kill := 1
	3kill := 1
	4kill := 1
	5kill := 1
	6kill := 1
	7kill := 1

	killstreakNumber := 0


	;en permanence
	While(1){
		if(isPlayerAlive() =1){
			isTotalOn := isTotalOn()
			if(isTotalOn = 1){
				killstreakNumber++
				;debugging purpose
				;MsgBox %killstreakNumber%
			}
			
			;MsgBox %killstreakNumber%
			
			
			
			;debugging purpose
			;if(killstreakNumber != 0){
			;	MsgBox killstreakNumber:%killstreakNumber%
			;}
			
			if(killstreakNumber=2 AND 2kill = 1){
				2_KillSound()
				2kill := 0
			}
			if(killstreakNumber=3 AND 3kill = 1){
				3_KillSound()
				3kill := 0
			}
			if(killstreakNumber=4 AND 4kill = 1){
				4_KillSound()
				4kill := 0
			}
			if(killstreakNumber=5 AND 5kill = 1){
				5_KillSound()
				5kill := 0
			}
			if(killstreakNumber=6 AND 6kill = 1){
				6_KillSound()
				6kill := 0
			}
			if(killstreakNumber=7 AND 7kill = 1){
				7_KillSound()
				7kill := 0
			}
			
			while(isTotalOn=1){
				isTotalOn := isTotalOn()
				;sleep, 50
			}
			
		}
		else{
			; reset for uniq killstreak's sounds triggering per life
			2kill := 1
			3kill := 1
			4kill := 1
			5kill := 1
			6kill := 1
			7kill := 1
			
			killstreakNumber := 0
		}
		
		;delay in ms
		;Sleep, 50
		
	}


isTotalOn(){
	;DONE: seems to work
	
	;TopLeftX = 1130
	;TopLeftY = 770
	
	global expectedWidthTotalOn
	global expectedHeightTotalOn
	
	;MsgBox isTotalOn:expectedWidthTotalOn: %expectedWidthTotalOn%
	;MsgBox isTotalOn:expectedHeightTotalOn: %expectedHeightTotalOn%
	
	
	
	;ok
	static xIsAliveTotal
	static yIsAliveTotal
	;xIsAliveTotal := 1117
	;yIsAliveTotal := 770
	;MsgBox expectedWidthTotalOn: %expectedWidthTotalOn%
	;MsgBox expectedHeightTotalOn: %expectedHeightTotalOn%
	xIsAliveTotal := expectedWidthTotalOn
	yIsAliveTotal := expectedHeightTotalOn
	PixelGetColor, color, xIsAliveTotal, yIsAliveTotal, RGB
	
	
	;FoundPos := RegExMatch("xxxabc123xyz", "abc.*xyz")  ; Returns 4, which is the position where the match was found.
	FoundPos := RegExMatch(color, "0xF.F.F.")  ; Returns 4, which is the position where the match was found.
	;MsgBox %color% %FoundPos%
	
	if(FoundPos = "1"){
		;MsgBox lol
		return 1
	}
	
	return 0
}


;killertag canvas
;272727
isPlayerAlive()
{
	global expectedWidthKillerTagTopRight
	global expectedHeightKillerTagTopRight
	static onceAlive
	
	;for isAlive() function
	if(!onceAlive){
		onceAlive += 1
		static xIsAlive
		static yIsAlive
		global screenWidth
		global screenHeight
		;MsgBox %screenWidth%,%screenHeight%
		;xIsAlive := Round(screenWidth / 2 ,0)+20+7
		;yIsAlive := screenHeight - 34 + 15
		;xIsAlive := 909
		;MsgBox isPlayerAlive:expectedWidthKillerTagTopRight: %expectedWidthKillerTagTopRight%
		;MsgBox isPlayerAlive:expectedHeightKillerTagTopRight: %expectedHeightKillerTagTopRight%
		;xIsAlive := 960
		;yIsAlive := 903
		xIsAlive := expectedWidthKillerTagTopRight
		yIsAlive := expectedHeightKillerTagTopRight
		;MsgBox IsAlive:%xIsAlive%,%yIsAlive%
	}
	
	;PixelGetColor, color, 983, 1046, RGB
	;res
	PixelGetColor, color, xIsAlive, yIsAlive, RGB
	;MsgBox IsAlive:%xIsAlive%,%yIsAlive%
	
	;debugging purpose
	;MsgBox %color%
	if(color = "0x272727"){
	;if(isHPZero() = 1){
		;SoundPlay, mp3/dead.mp3 ;ok res
		return 0
	}
	else{
		;SoundPlay, mp3/censor-beep-sound-effect-256kbit.mp3
		return 1
	}
}


;DONE=========================
;ok
2_KillSound(){
	SoundPlay, mp3/doublekill.mp3
	return
}
3_KillSound(){
	SoundPlay, mp3/multikill.mp3
	return
}
4_KillSound(){
	SoundPlay, mp3/megakill.mp3
	return
}
5_KillSound(){
	SoundPlay, mp3/monsterkill.mp3
	return
}
6_KillSound(){
	SoundPlay, mp3/ultrakill.mp3
	return
}
7_KillSound(){
	SoundPlay, mp3/holyshit.mp3
	return
}