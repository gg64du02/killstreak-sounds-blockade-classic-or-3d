MButton::
	ReadZone()
return

ReadZone(){
	tmpFile =output_zonev0.1.txt
	;tmpFile =D:\AHK_Scripts\output_zonev0.1.txt
	FileAppend, ========================`r`n, %tmpFile%
	
	;WARNING the v0.1 takes several seconds
	;speed up the code (done in v0.2)
	
	;check position
	;check color
	
	TopLeftX = 909
	TopLeftY = 903
	BotRightX = 911
	BotRightY = 905
	
	indexX := TopLeftX - BotRightX
	indexY := TopLeftY - BotRightY
	
	;MsgBox indexX: %indexX%           indexY: %indexY%
	
	line := BotRightY
	;MsgBox line: %line%
	
	while( line < TopLeftY){
	
		;MsgBox line: %line%
		
		pixel := BotRightX
		
		;MsgBox pixel:%pixel%      TopLeftX:%TopLeftX%
		
		while( pixel < TopLeftX){
			;getPixelColor
			PixelGetColor, color, pixel, line, RGB
			
			;append a pixel
			tmpString = %tmpString% %color%
			
			;next pixel on the line
			pixel := pixel + 1
		}
		;next line
		line := line + 1
		
		;line appended
		FileAppend, %tmpString%`r`n, %tmpFile%
		
		;reset
		tmpString =
		
	}
	
	SoundPlay, mp3/censor-beep-1.mp3
	
	
	return
}