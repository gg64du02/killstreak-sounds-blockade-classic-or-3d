
ListLines Off

	SoundPlay, mp3/censor-beep-1.mp3
	
	
	;===========PLEASE SET ME UP===========
	SysGet, VirtualScreenWidth, 78
	SysGet, VirtualScreenHeight, 79
	
	global sreenWidth   := VirtualScreenWidth
	global screenHeight := VirtualScreenHeight
	
	MsgBox,
	(
	DETECTED DESKTOP RESOLUTION: %VirtualScreenWidth%,%VirtualScreenHeight%
	
	ATTENTION: Go fullscreen in order to get it to work
	ATTENTION: Desktop and ingame resolution HAVE TO BE THE SAME
	ATTENTION: This script was made for ONE SCREEN USER
	
	CREDITS: freely created by gg64du02 (Steam)
	CREDITS: idea and sounds by [D]arktooth (Steam) with AutoHotKey
	)
	
	;========================================
	;===========PLEASE SET ME UP===========
	;global sreenWidth   := 1920
	;global screenHeight := 1080
	;========================================
	
	guessNumber()
	
	
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
	
return

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
		xIsAlive := Round(sreenWidth / 2 ,0)+20+7
		yIsAlive := screenHeight - 34 + 15
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
	if(isHPZero() = 1){
		;SoundPlay, mp3/dead.mp3 ;ok res
		return 0
	}
	else{
		;SoundPlay, mp3/censor-beep-sound-effect-256kbit.mp3
		return 1
	}
}

;v0.7
isHPZero(){
	global sreenWidth
	global screenHeight
	
	static point1x
	static point2x
	static point3x
	static point4x
	static point5x
	
	static point1y
	static point2y
	static point3y
	static point4y
	static point5y
	
	;972 (in 1080*1920)
	point1x := Round(sreenWidth / 2 ,0)+12
	;965 (in 1080*1920)
	point2x := Round(sreenWidth / 2 ,0)+5
	;972 (in 1080*1920)
	point3x := Round(sreenWidth / 2 ,0)+12
	point4x := Round(sreenWidth / 2 ,0)+27
	;972 (in 1080*1920)
	point5x := Round(sreenWidth / 2 ,0)+12
	 
	;1044 (in 1080*1920)
	point1y := screenHeight - 36
	;1055 (in 1080*1920)
	point2y := screenHeight - 25
	point3y := screenHeight - 25
	;1062 (in 1080*1920)
	point4y := screenHeight - 18
	;1066 (in 1080*1920)
	point5y := screenHeight - 12
	
	
	PixelGetColor, PC1, point1x, point1y, RGB ;ok
	PixelGetColor, PC2, point2x, point2y, RGB ;ok
	PixelGetColor, PC3, point3x, point3y, RGB ;ok
	PixelGetColor, PC4, point4x, point4y, RGB ;ok
	PixelGetColor, PC5, point5x, point5y, RGB ;ok
	
	if(	( PC1 = "0xFF0000" ) AND ( PC2 = "0xFF0000" ) ){
		if(( PC4 = "0xFF0000" ) AND ( PC5 = "0xFF0000" ))
		{
			if( ( PC3 = "0xFF0000" ) = 0 )
			{
				;SoundPlay, mp3/dead.mp3 ;ok res
				return 1
			}
		}
	}
	;====================================================================
	
	
	;means that the hp is NOT zero
	return 0
}

killstreakNumber(){
	;checking the plus char
	;964-386 number
	;946-387
	plusCharDetect = 0
	
	;1920*1080
	;PixelGetColor, colorCenter, 947, 386, RGB
	
	;res
	static onceKSN
	
	if(!onceKSN){
		onceKSN:=1
		global sreenWidth
		global screenHeight
		static xPlus
		static yPlus
		;960-13 en 1920*1080
		xPlus := Round(sreenWidth / 2 - 13 , 0) 
		;386 en 1920*1080
		yPlus := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0) 
		;MsgBox xPlus:%xPlus%            yPlus:%yPlus%
	}
	PixelGetColor, colorCenter, xPlus, yPlus, RGB
	if( isRelevantColor(colorCenter) = 1 ){
		plusCharDetect = 1
	}
	if( plusCharDetect = 1 ){
		return guessNumber()
	}
	;TODO
	return 0
}

guessNumber(){
	;TODO
	;check the point in the code and in purple.xcf
	
	;clockwise see purple.xcf
	; X-x>
	;Y
	;|
	;x
	
	static once
	
	;res static needed
	if(!once){
		once := 1
		global sreenWidth
		global screenHeight
		;MsgBox once ?
		
		static xColor1
		static xColor2
		static xColor3
		static xColor4
		static xColor5
		static xColor6
		static xColor7
		static xColor8
		static xColor9
		
		static yColor1
		static yColor2
		static yColor3
		static yColor4
		static yColor5
		static yColor6
		static yColor7
		static yColor8
		static yColor9
	
		;MsgBox sreenWidth:%sreenWidth% screenHeight:%screenHeight%

		;for guessNumber() function
		xColor1 := Round( sreenWidth/2 		, 0)
		xColor2 := Round( sreenWidth/2+8 	, 0)
		xColor3 := Round( sreenWidth/2+12 	, 0)
		xColor4 := Round( sreenWidth/2+12 	, 0)
		xColor5 := Round( sreenWidth/2+12 	, 0)
		xColor6 := Round( sreenWidth/2+12 	, 0)
		xColor7 := Round( sreenWidth/2 		, 0)
		xColor8 := Round( sreenWidth/2 		, 0)
		xColor9 := Round( sreenWidth/2 		, 0)
		
		;5 pixel missing
		yColor1 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0)
		yColor2 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0)
		yColor3 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0)
		yColor4 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0) +3
		yColor5 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0) +7
		yColor6 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0) +15
		yColor7 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0) +15
		yColor8 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0) +9
		yColor9 := Round( (((screenHeight * 220 ) / 640) + 0.5) + 1 + 6 , 0) +7
		
		;MsgBox 1:%xColor1%,%yColor1%, 2:%xColor2%,%yColor2%, 3:%xColor3%,%yColor3%
		;MsgBox 4:%xColor4%,%yColor4%, 5:%xColor5%,%yColor5%, 6:%xColor6%,%yColor6%
		;MsgBox 7:%xColor7%,%yColor7%, 8:%xColor8%,%yColor8%, 9:%xColor9%,%yColor9%
	}
	
	
	;123
	;PixelGetColor, color1, 960, 379, RGB ;ok
	;PixelGetColor, color2, 968, 379, RGB ;ok
	;PixelGetColor, color3, 972, 379, RGB ;ok
	;res
	PixelGetColor, color1, xColor1, yColor1, RGB ;ok
	PixelGetColor, color2, xColor2, yColor2, RGB ;ok
	PixelGetColor, color3, xColor3, yColor3, RGB ;ok
	
	;4
	;5
	;6
	;PixelGetColor, color4, 972, 382, RGB ;ok
	;PixelGetColor, color5, 972, 386, RGB ;ok
	;PixelGetColor, color6, 972, 394, RGB ;ok
	;res
	PixelGetColor, color4, xColor4, yColor4, RGB ;ok
	PixelGetColor, color5, xColor5, yColor5, RGB ;ok
	PixelGetColor, color6, xColor6, yColor6, RGB ;ok
	
	;9
	;8
	;7
	;PixelGetColor, color7, 960, 394, RGB ;ok
	;PixelGetColor, color8, 960, 388, RGB ;ok
	;PixelGetColor, color9, 960, 386, RGB ;ok
	;res
	PixelGetColor, color7, xColor7, yColor7, RGB ;ok
	PixelGetColor, color8, xColor8, yColor8, RGB ;ok
	PixelGetColor, color9, xColor9, yColor9, RGB ;ok
	
	;1:ok
	;if( isRelevantColor(color1) = 1 AND isRelevantColor(color2) = 0 AND isRelevantColor(color3) = 0){
	;	if( isRelevantColor(color4) = 0 AND isRelevantColor(color5) = 0 AND isRelevantColor(color6) = 0){
	;		if( isRelevantColor(color7) = 0 AND isRelevantColor(color8) = 0 AND isRelevantColor(color9) = 0){
	;			return 1
	;		}
	;	}
	;}
	
	;2:ok tested
	if( isRelevantColor(color1) = 1 AND isRelevantColor(color2) = 1 AND isRelevantColor(color3) = 1){ ;ok
		if( isRelevantColor(color4) = 1 AND isRelevantColor(color5) = 1 AND isRelevantColor(color6) = 1){
			if( isRelevantColor(color7) = 1 AND isRelevantColor(color8) = 1 AND isRelevantColor(color9) = 1){
				return 2
			}
		}
	}
	
	;3:ok not working
	if( isRelevantColor(color1) = 1 AND isRelevantColor(color2) = 1 AND isRelevantColor(color3) = 1){ ;ok
		if( isRelevantColor(color4) = 1 AND isRelevantColor(color5) = 1 AND isRelevantColor(color6) = 1){ ;ok
			;Sleep 40
			;MsgBox color7:%color7%  color8:%color8%  color9:%color9%  
			if( isRelevantColor(color7) = 1 AND isRelevantColor(color8) = 0 AND isRelevantColor(color9) = 0){
				;MsgBox 3 kill
				return 3
			}
		}
	}
	
	;4:ok tested
	if( isRelevantColor(color1) = 1 AND isRelevantColor(color2) = 0 AND isRelevantColor(color3) = 1){
		if( isRelevantColor(color4) = 1 AND isRelevantColor(color5) = 1 AND isRelevantColor(color6) = 1){
			if( isRelevantColor(color7) = 0 AND isRelevantColor(color8) = 0 AND isRelevantColor(color9) = 1){
				return 4
			}
		}
	}
	
	;5:ok tested
	if( isRelevantColor(color1) = 1 AND isRelevantColor(color2) = 1 AND isRelevantColor(color3) = 1){
		if( isRelevantColor(color4) = 0 AND isRelevantColor(color5) = 1 AND isRelevantColor(color6) = 1){
			if( isRelevantColor(color7) = 1 AND isRelevantColor(color8) = 0 AND isRelevantColor(color9) = 1){
				return 5
			}
		}
	}
	
	;6: ok
	if( isRelevantColor(color1) = 1 AND isRelevantColor(color2) = 1 AND isRelevantColor(color3) = 1){
		if( isRelevantColor(color4) = 0 AND isRelevantColor(color5) = 1 AND isRelevantColor(color6) = 1){
			if( isRelevantColor(color7) = 1 AND isRelevantColor(color8) = 1 AND isRelevantColor(color9) = 1){
				return 6
			}
		}
	}
	
	;7:
	if( isRelevantColor(color1) = 1 AND isRelevantColor(color2) = 1 AND isRelevantColor(color3) = 0){
		if( isRelevantColor(color4) = 0 AND isRelevantColor(color5) = 0 AND isRelevantColor(color6) = 0){
			if( isRelevantColor(color7) = 0 AND isRelevantColor(color8) = 0 AND isRelevantColor(color9) = 0){
				return 7
			}
		}
	}
	
	return 0
}

isRelevantColor(testColor){
	;red is 0xFF0000
	;yellow is 0xFFFF00
	;blue is 0x0000FF
	;green is 0x00FF00
	if(testColor = "0xFF0000" OR testColor = "0xFFFF00" OR testColor = "0x0000FF" OR testColor = "0x00FF00"){
		return 1
	}
	return 0
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

