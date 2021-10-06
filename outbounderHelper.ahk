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
Gui, Add, Button, Default x145 y80 w100 h30 gShowRelo , Relo


;Gui, Add, Text,cRed , Use the first Line when there are no cms account or dupe leads

;telly to show how many sales and number of calls 
Gui, Add, ListView, x0 r20 w700 , Calls | Sales | Moblie sales | Fetch | Date Of Sales


;----------------------Relo-------Gui---------------------
 Gui, reloz:Add, Text,cRed section xm w130, Customer Name:
 Gui, reloz:Add, Edit, cRed vCustName w200 ys
 Gui, reloz:Add, Text,cRed section xm w150, Is there a Connection Date or Tech Appointment required?
 Gui, reloz:Add, Radio, cRed vCD1 checked, Connection Date
 Gui, reloz:Add, Radio, cRed vCD2, Tech Appointment
 Gui, reloz:Add, Radio, cRed vCD3, Tech Appointment or Arrival of NBN Device
 Gui, reloz:Add, Text,cRed section xm w100, Connection Date:
 Gui, reloz:Add, Edit,cRed vConnectionDate  w200 ys
 Gui, reloz:Add, Text,cRed section xm w130, How are we closing the old service?
 Gui, reloz:Add, Radio, cRed  vCL1 checked, Set date
 Gui, reloz:Add, Radio, cRed vCL2, 1-5 days after the service goes live
 Gui, reloz:Add, Radio, cRed vCL3, Customer to call at their descretion
 Gui, reloz:Add, Text,cRed section xm w130, Closure Date (If applicable):
 Gui, reloz:Add, Edit,cRed vClosureDate  w200 ys
 Gui, reloz:Add, Text,cRed section xm w130, Old Billing Address Address:
 Gui, reloz:Add, Edit,cRed vOldPost w200 ys
 Gui, reloz:Add, Text,cRed section xm w130, New Billing Address Address:
 Gui, reloz:Add, Edit,cRed vNewPost w200 ys
 Gui, reloz:Add, Text,cRed section xm w130, New Mobile Number:
 Gui, reloz:Add, Edit,cRed vMobile w200 ys
 Gui, reloz:Add, Edit,cRed vEmail w200 ys
 Gui, reloz:Add, Text,cRed section xm w130, Are there any services additional being relocated?
 Gui, reloz:Add, Radio, cRed  ys vReloServ1, Yes
 Gui, reloz:Add, Radio, cRed  ys vReloServ2 Checked, No
 Gui, reloz:Add, Text,cRed section xm w130, Service 1:
 Gui, reloz:Add, DDL,cRed vServiceType1 w200 ys, VoIP|Mobile|Fetch TV|
 Gui, reloz:Add, Text,cRed section xm w130, Service 2:
 Gui, reloz:Add, Edit,cRed vServiceType2  w200 ys,
 Gui, reloz:Add, Text,cRed section xm w130, Service 3:
 Gui, reloz:Add, Edit,cRed vServiceType3  w200 ys,
 Gui, reloz:Add, Button, w150 xm section gRelozButtonSubmit, Submit
 Gui, reloz:Add, Button, w150 ys gRelozButtonClose, Close


Gui, Show, w400 h190, OutBounder Helper,Gui
Return 


calls := 0
nbnSales := 0
AutoCall := 0
global matchingLeads 
global moveMouseSpeed := 500
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
	;add parma into how quick the mouse move 1000 is 1 second
	WideSalesLeaveMessageOne(100,100)
	
	
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
			
	
	
	;this closes the lead and leave a message on widesales
	WideSalesLeaveMessageTwo(100,100)
	

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
			
	
	
	;this closes the lead and leave a message on widesales
	WideSalesLeaveMessageThree(100,100)
	

	BlockInput Off
    
    

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

RelozButtonClose:
{
     MsgBox, 4, , Do you want to close dialogue? (Press YES or NO)
     IfMsgBox No
         return
     Gui, Cancel
     Exit
}

 RelozButtonSubmit:
{
	if WinExist("ahk_exe notepad++.exe")
		 WinActivate
	 Gui, Submit  ; Save the input from the user to each control's associated variable
		 If(CD3==1){
	SendInput Dear %CustName%,{enter 2}Thank you for your time today.{enter}As discussed with you on the phone, we have arranged the relocation of your service from your old address at %OldPost% to your new address of %NewPost%.{enter}Your new service will be connected soon after the tech appointment OR 1-5 days from the date of the NBN box arriving.
	 
	 }
	 
	 If(CD2==1){
	 SendInput Dear %CustName%,{enter 2}Thank you for your time today.{enter}As discussed with you on the phone, we have arranged the relocation of your service from your old address at %OldPost% to your new address of %NewPost%.{enter}Your new service will be connected soon after the tech appointment.
	 
	 }
	 
	 If(CD1==1){
	 SendInput Dear %CustName%,{enter 2}Thank you for your time today.{enter}As discussed with you on the phone, we have arranged the relocation of your service from your old address at %OldPost% to your new address of %NewPost%.{enter}Your new service will be connected 1-5 days from the date of %ConnectionDate%.{enter 2}
	 
	 }
	 
	 If(CL1==1){
	 SendInput I have arranged the closure of your previous service for %ClosureDate%.{enter2}
	 
	 } 
	 
	 If(CL3==1){
	 SendInput You will need to call us back to arrange closure of your old service when you are ready for it to close off.{enter 2}
	 
	 }
	 
	 If(CL2==1){
	 SendInput We will close off your old service up to 5 days after your new service goes live.{enter 2}
	 
	 }
	 
	 If(ReloServ1==1){
	 SendInput I have also arranged for the address of your %ServiceType1%, %ServiceType2% and %ServiceType3% service to be updated to your new address.{enter 2}
	 
	 }
	 
	 SendInput {enter 2}If you have any further questions, please feel free to contact us on 1300 880 905, or simply reply to this email.{enter 2}Thank you again.{enter 2}%NewPost%
	 
	 Gui, Cancel
		 Exit
 }

ShowRelo:
{
 Gui, reloz:Show,w600 h540, Relocation, Gui 1
 return

}


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




