#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;making the 1920*1080 (actual desktop resolution) set as 1024*768 (in game settings resolution)

; ListLines Off

;MButton::

;TODO: need to be speed up way more
;TODO: need to add rejection of fa&lse detection on isTotalOn


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
			while(isTotalOn=1){
				isTotalOn := isTotalOn()
				sleep, 50
			}
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
	Sleep, 50
	
}


isTotalOn(){
	;DONE: seems to work
	
	;TopLeftX = 1130
	;TopLeftY = 770
	
	;ok
	static xIsAliveTotal
	static yIsAliveTotal
	xIsAliveTotal := 1117
	yIsAliveTotal := 770
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


;272727
isPlayerAlive()
{
	;global xIsAlive
	;global yIsAlive
	static onceAlive
	
	;for isAlive() function
	if(!onceAlive){
		onceAlive += 1
		static xIsAlive
		static yIsAlive
		global sreenWidth
		global screenHeight
		;MsgBox %sreenWidth%,%screenHeight%
		;xIsAlive := Round(sreenWidth / 2 ,0)+20+7
		;yIsAlive := screenHeight - 34 + 15
		;xIsAlive := 909
		xIsAlive := 960
		yIsAlive := 903
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