#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include outbounderHelp-WideSales.ahk


WideSalesLeaveMessageOne()
{

	sleep,30
	click, 881, 702 
	send,{L down}
	sleep,30
	click, 965, 456 
	;;To turn off the send text
	click, 888, 729
	
	;close the lead
	click, 1130, 822


}

WideSalesLeaveMessageTwo()
{

	sleep,30
	click, 881, 702 
	send,{L down}
	sleep,30
	click, 965, 456 
	;;To turn off the send text
	click, 888, 729
	
	;close the lead
	click, 1130, 822


}