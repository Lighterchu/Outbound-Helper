#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode,Mouse ,screen
#Include outbounderHelp-WideSales.ahk



;#----------------------HANDELS THE GUI------------------------



Gui, Color, 000000
Gui, Font,, Lucida Fax


Gui, Add, Text,cRed , Use the first Line when there are no cms account or dupe leads





Gui, +AlwaysOnTop
Gui, Add, Button, Default x10 y30 w100 h30 gLeftMessageOne ,Leave Voice Message One
Gui, Add, Button, Default x145 y30 w100 h30 gLeftMessageTwo,Leave Voice Message Two
Gui, Add, Button, Default x280 y30 w100 h30 gLeftMessageThree,Leave Voice Message Three

Gui, Add, Button, Default x10 y80 w100 h30 gManualLeavingMessage,Manual Leave message
Gui, Add, Button, Default x280 y80 w100 h30 gAutoCall, AutoCall
Gui, Add, Button, Default x145 y80 w100 h30 gTest ,Test Button


;Gui, Add, Text,cRed , Use the first Line when there are no cms account or dupe leads

;telly to show how many sales and number of calls 
Gui, Add, ListView, x0 r20 w700 , Calls | Sales | Moblie sales | Fetch | Date Of Sales




Gui, Show, w400 h190, OutBounder Helper,Gui
Return 


calls := 0
nbnSales := 0
AutoCall := 0
global matchingLeads 
devmode := 1
holdSaveAndCLoseButton := 154, 822


;#----------------------------------------------

;#--------------------FUNCTIONS--------------------------

ManualLeavingMessage()
{
    
    BlockInput On
	; move the mouse to the next window click on it and then leave message
	click, 1999, 430
	CoordMode,Mouse ,window
	click, 65, 241
	click, 204, 237
	click, 216, 195
	
	HandUpCall()
	BlockInput Off
    
}


HandUpCall()
{
	CoordMode,Mouse ,screen
	click, 2310, 939
}


LeftMessageOne()
{
	
	BlockInput On
	;clicks on the MicroSIP and leaves a voice mails 
	; move the mouse to the next window click on it and then leave message
	click, 1999, 430
	CoordMode,Mouse ,window
	click, 65, 241
	click, 204, 237
	click, 216, 195
	
	;Click the hung up window
	HandUpCall()
	
	MsgBox, 4,, Is this a dupe or account? (press Yes or No)
	IfMsgBox Yes
		click, 157, 821
	else
		click, 154, 736
			
	
	;if there is a dupe or account, then we change the click location
	;reason for the outcome of the call
	;click, holdSaveAndCLoseButton
	WideSalesLeaveMessageOne()
	
	
	BlockInput Off
}

LeftMessageTwo()
{
	BlockInput On
	; move the mouse to the next window click on it and then leave message
	click, 1999, 430
	CoordMode,Mouse ,window
	click, 65, 241
	click, 204, 237
	click, 216, 195
	
	;Click the hung up window
	HandUpCall()
	
	MsgBox, 4,, Is this a dupe or account? (press Yes or No)
	IfMsgBox Yes
		click, 157, 821
	else
		click, 154, 736
			
	;if there is a dupe or account, then we change the click location
	;reason for the outcome of the call
	click, holdSaveAndCLoseButton
	
	;this closes the lead and leave a message on widesales
	WideSalesLeaveMessageTwo()
	

	BlockInput Off
    
    

}

LeftMessageThree()
{
	BlockInput On
	; move the mouse to the next window click on it and then leave message
	click, 1999, 430
	CoordMode,Mouse ,window
	click, 65, 241
	click, 204, 237
	click, 216, 195
	
	;Click the hung up window
	HandUpCall()
	
	MsgBox, 4,, Is this a dupe or account? (press Yes or No)
	IfMsgBox Yes
		click, 157, 821
	else
		click, 154, 736
			
	;if there is a dupe or account, then we change the click location
	;reason for the outcome of the call
	click, holdSaveAndCLoseButton
	
	;this closes the lead and leave a message on widesales
	WideSalesLeaveMessageThree()
	

	BlockInput Off
    
    

}

testing := 0
Test()
{
 testing++

 LV_Add(testing, 1, 10, 5, 2,"18-08-2021")
	
}

ManualMessage()
{
	BlockInput On
	; move the mouse to the next window click on it and then leave message
	click, 1999, 430
	CoordMode,Mouse ,window
	click, 65, 241
	click, 204, 237
	click, 216, 195
	
	;Click the hung up window
	CoordMode,Mouse ,screen
	click, 2310, 939
	BlockInput Off
}

AutoCalling()
{
   LV_ModifyCol(1,10)
    
    BlockInput On
    ; clicking on the number
    click, 275, 355
    
  
    ;clicking ok 
    MouseMove, 1046, 206, 70
    sleep, 100
    
    BlockInput off
    
    ;need to have this out of the BlockINput for the reason it wont work otherwise
    send,{Enter}
}





;#--------------------------------------------------------

;#------------------------LOGIC--------------------------------

LeftMessageOne:
LeftMessageOne()
return 

LeftMessageTwo:
LeftMessageTwo()
return 


LeftMessageThree:
LeftMessageThree()
return 

;testing auto call
AutoCall:
AutoCalling()
return

::]m::
if WinExist("MicroSIP")
{
	ManualMessage() 
}
return 



:*:]c::  	
send,Converted
Return

::]test::
send,{Enter}
return

::]d:: 	
send, Dupe lead 
Return

:*:]s:: 
send,Slacked to 
return

:*:]relo:: 
send,Relocation Of Service
Return

::]dis:: 
send, Disconnected
Click, 2343, 929
return

:*:]pass::
send, Please Pass to me 2338
return



^q::ExitApp




