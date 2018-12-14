MButton::
	ReadZone()
return

ReadZone(){
	;FileName =D:\AHK_Scripts\output_zoneV0.2.txt
	FileName =output_zoneV0.2.txt
	file := FileOpen(FileName, "w")
	if !IsObject(file)
	{
		MsgBox Can't open "%FileName%" for writing.
		return
	}
	
	;notepad and notepad++ compatibility
	equalsString ======================`r`n
	file.Write(equalsString)
	
	
	;TopLeftX = 974
	;TopLeftY = 397
	;BotRightX = 939
	;BotRightY = 377
	
	TopLeftX = 1130
	TopLeftY = 770
	BotRightX = 1117
	BotRightY = 758
	
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
		;FileAppend, %tmpString%`n, D:\AHK_Scripts\zone.txt
		
		;MsgBox %tmpString%
		
		;notepad and notepad++ compatibility
		tmpString =%tmpString%`r`n
		file.Write(tmpString)
		
		;reset
		tmpString =
		
	}
	
	;TODO fileClose
	
	SoundPlay, mp3/censor-beep-1.mp3
	
	
	return
}