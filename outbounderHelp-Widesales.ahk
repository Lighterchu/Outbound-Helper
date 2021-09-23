#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;this holds all the widesales Logic and then used into the main outboundHelper

delayToOpenLead := 2400


WideSalesLeaveMessageOne()
{
	BlockInput On
	sleep,10
	click, 881, 702 
	send,{L down}
	sleep,10
	click, 965, 456 
	;;To turn off the send text
	click, 888, 729
	
	;close the lead
	click, 1130, 822
	
	;once done with the lead it will open a new lead
	sleep, delayToOpenLead
	WideSalesOpenNewLead()
	BlockInput off

}

WideSalesLeaveMessageTwo()
{
	BlockInput On
	sleep,20
	click, 881, 702 
	send,{L down}
	sleep,20
	click, 965, 456 
	
	;close the lead
	click, 1131, 876
	
	;once done with the lead it will open a new lead
	sleep, delayToOpenLead
	WideSalesOpenNewLead()
	
	BlockInput off
	
}

WideSalesLeaveMessageThree()
{
	BlockInput On
	sleep,19
	click, 881, 702 
	send,{L down}
	sleep,30
	click, 965, 456 
		MsgBox, 4,, is date right to send a email? (press Yes or No)
		IfMsgBox Yes
		
		;need to have this here for the reason the mouse does move
		BlockInput On
		;turn off send sms 
		click, 887, 725
		sleep, 20
		;close the lead
		click, 1133, 810
		
		;once done with the lead it will open a new lead
		sleep, delayToOpenLead
		WideSalesOpenNewLead()
		
		return
	
	;sending manaul email and setting it back for 6 months
	
		BlockInput off
	
}

WideSalesOpenNewLead()
{

	click, 1485, 190

}