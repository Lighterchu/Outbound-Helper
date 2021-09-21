#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;this holds all the widesales Logic and then used into the main outboundHelper


WideSalesLeaveMessageOne()
{
	BlockInput On
	sleep,30
	click, 881, 702 
	send,{L down}
	sleep,30
	click, 965, 456 
	;;To turn off the send text
	click, 888, 729
	
	;close the lead
	click, 1130, 822
	BlockInput off

}

WideSalesLeaveMessageTwo()
{
	BlockInput On
	sleep,30
	click, 881, 702 
	send,{L down}
	sleep,30
	click, 965, 456 
	
	;close the lead
	click, 1130, 822
	BlockInput off
	
}

WideSalesLeaveMessageThree()
{
	BlockInput On
	sleep,30
	click, 881, 702 
	
	MsgBox, 4,, is date right to send a email? (press Yes or No)
	IfMsgBox Yes
		send,{L down}
		sleep,30
		click, 965, 456 
		
		;close the lead
		click, 1130, 822
	
		return
	
	;sending manaul email and setting it back for 6 months
	
		BlockInput off
	
}