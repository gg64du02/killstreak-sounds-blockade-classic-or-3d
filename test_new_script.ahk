#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;making the 1920*108 set as 1024*768

; ListLines Off

MButton::


;initialization for uniq killstreak's sounds triggering per life
2kill := 1
3kill := 1
4kill := 1
5kill := 1
6kill := 1
7kill := 1


;en permanence
While(1){
	if(isPlayerAlive() =1){
		killstreakNumber := killstreakNumber()
		
		MsgBox There
		
		;debugging purpose
		;if(killstreakNumber != 0){
		;	MsgBox killstreakNumber:%killstreakNumber%
		;}
		
		;if(killstreakNumber()=2){
		if(killstreakNumber=2 AND 2kill = 1){
			2_KillSound()
			2kill := 0
		}
		;if(killstreakNumber()=3){
		if(killstreakNumber=3 AND 3kill = 1){
			3_KillSound()
			3kill := 0
		}
		;if(killstreakNumber()=4){
		if(killstreakNumber=4 AND 4kill = 1){
			4_KillSound()
			4kill := 0
		}
		;if(killstreakNumber()=5){
		if(killstreakNumber=5 AND 5kill = 1){
			5_KillSound()
			5kill := 0
		}
		;if(killstreakNumber()=6){
		if(killstreakNumber=6 AND 6kill = 1){
			6_KillSound()
			6kill := 0
		}
		;if(killstreakNumber()=7){
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
	}
	
	;delay in ms
	Sleep, 50
	
}


killstreakNumber(){
	;TODO
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
	;Send {ESC}
	;Sleep, 5000
	;MouseClick, X1, xIsAlive , yIsAlive , 1, 0
	;Sleep, 5000
	
	;MsgBox The color at the current cursor position is %color%.
	;bugfix v0.8
	;if(color = "0xFF0000"){
	;here
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