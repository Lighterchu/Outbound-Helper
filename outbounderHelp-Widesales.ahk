#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include outbounderHelp-WideSales.ahk

WideSalesLogic(leaveMessageType)
{
	switch leaveMessageType
	{
	case 1:
		MsgBox, You entered "%UserInput%", which is the maximum length of text.
		return
	case 2:
		MsgBox, You entered "%UserInput%" at which time the input timed out.
		return
	case 3:
		return
	default:
		MsgBox, That is not a message type
	}
	
	
    if(matchingLeads = 1) 
    {
        MsgBox, this is a Matching Lead
    }else
    {
        MsgBox, This is a normal Lead
    }
	
}

CheckingIfMatchingLead(isMatching)
{
	 if(matchingLeads = 1) 
    {
        MsgBox, this is a Matching Lead
    }else
    {
        MsgBox, This is a normal Lead
    }
}