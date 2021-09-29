#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;this holds all the widesales Logic and then used into the main outboundHelper



;add parma actionOfMovingTheMouse How quick to move the mouse 
;add parma delayToOpenLead How quick to open a new lead
WideSalesLeaveMessageOne(actionOfMovingTheMouse,delayToOpenLead)
{
	BlockInput On
	sleep,%actionOfMovingTheMouse%
	click, 881, 702 
	send,{L down}
	sleep,%actionOfMovingTheMouse%
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
;add parma actionOfMovingTheMouse How quick to move the mouse 
;add parma delayToOpenLead How quick to open a new lead
WideSalesLeaveMessageTwo(actionOfMovingTheMouse,delayToOpenLead)
{
	BlockInput On
	sleep,%actionOfMovingTheMouse%
	click, 881, 702 
	send,{L down}
	sleep,%actionOfMovingTheMouse%
	click, 965, 456 
	
	;close the lead
	click, 1131, 876
	
	;once done with the lead it will open a new lead
	sleep, delayToOpenLead
	WideSalesOpenNewLead()
	
	BlockInput off
	
}
;add parma actionOfMovingTheMouse How quick to move the mouse 
;add parma delayToOpenLead How quick to open a new lead
WideSalesLeaveMessageThree(actionOfMovingTheMouse,delayToOpenLead)
{
	BlockInput On
	sleep,%actionOfMovingTheMouse%
	click, 881, 702 
	send,{L down}
	sleep,%actionOfMovingTheMouse%
	click, 965, 456 
		MsgBox, 4,, is date right to send a email? (press Yes or No)
		IfMsgBox Yes
		
		;need to have this here for the reason the mouse does move
		BlockInput On
		;turn off send sms 
		click, 887, 725
		sleep,%actionOfMovingTheMouse%
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