#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode,Mouse ,screen




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

WideSalesLogicMessageOne()
{

	

	;reason for the outcome of the call
	click, 143, 731
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

WideSalesLogic()
{
    
	
    if(matchingLeads = 1) 
    {
        MsgBox, this is a Matching Lead
    }else
    {
        MsgBox, This is a normal Lead
    }
	
	

}


WideSalesLogicMessageTwo()
{

	

	;reason for the outcome of the call
	click, 143, 731
	sleep,30
	click, 881, 702 
	send,{L down}
	sleep,30
	click, 965, 456 
	
	
	;close the lead
	click, 1109, 872
	

}

HandUpCall()
{
	CoordMode,Mouse ,screen
	click, 2310, 939
}


LeftMessageOne()
{
	
	
   matchingLeads =: 0
   
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
	
	  ;Ask the user if there is a dupe, if yes manaul leave message
     MsgBox, 4, , is there a dupe and account ?, 5  ; 5-second timeout.
     IfMsgBox, yes
	 ;matchingLeads =: 1
	 ;WideSalesLogic() 
     Return  
     
     
	
	
	;CLose the lead 
	;save and close is in a differ location, we have to change the click
	;click, 1130, 822
	WideSalesLogicMessageOne()
	
	
	
	BlockInput Off
}

LeftMessageOneMatchLead()
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
	
	
	
  
    ;change over to widesales 2.0 and close reason 
	;Working progress not reaaady yet
	 click, 168, 818
	
	;CLose the lead 
	click, 1138, 882
	
	
	BlockInput Off
	
}



LeftMessageTwo()
{
	matchLead =: 0
	
	BlockInput On
	; move the mouse to the next window click on it and then leave message
	click, 1999, 430
	CoordMode,Mouse ,window
	click, 65, 241
	click, 204, 237
	click, 216, 195
	
	;Click the hung up window
	HandUpCall()
	
    ;Ask the user if there is a dupe, if yes manaul leave message
    
    ;if user does not click anything means it will guess the there is No
    ; dupe or account 
     MsgBox, 4, , is there a dupe and account ?, 5  ; 5-second timeout.
     IfMsgBox yes 
	 ;matchingLeads =: 1
	 ;WideSalesLogic() 
	 Return
    
	
	WideSalesLogicMessageTwo()
	

	
	
	
	BlockInput Off
    
    

}

testing := 0
Test()
{
 testing++
 FormatTime, OutputVar, 20040228 LSys D1 D4
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
   LV_ModifyCol(1,"testing")
    
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


;Needs more work, not ready yet for auto calling
AutoCallingLogic()
{
    sleep, 35000
     BlockInput On
	; move the mouse to the next window click on it and then leave message
	click, 1999, 430
	CoordMode,Mouse ,window
	click, 65, 241
	click, 204, 237
	click, 216, 195
	
	;Click the hung up window
	HandUpCall()
	
    ;Ask the user if there is a dupe, if yes manaul leave message
    
    ;if user does not click anything means it will guess the there is No
    ; dupe or account 
     MsgBox, 4, , is there a dupe and account ?, 5  ; 5-second timeout.
     IfMsgBox, yes
     Return
    
	
	;change over to widesales 2.0 and close reason 
	click, 143, 731
	sleep,50
	click, 881, 702 
	send,{L down}
	sleep,50
	click, 965, 456 
	
	;CLose the lead 
	click, 1122, 880
	
	
	
	BlockInput Off
}


WinGetActiveTitle() {
	WinGetActiveTitle, v
	Return, v
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
MsgBox, Left Voice Message Setting Callback and Sending Email
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





;%


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




