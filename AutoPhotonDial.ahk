#NoEnv
#include StdoutToVar.ahk

SendMode Input
SetWorkingDir %A_ScriptDir%

connection = TATA HSIA
userName = internet
password = internet

If ConnectedToInternet() 
{
	DUN := StdoutToVar_CreateProcess("RasDial """ . "TATA HSIA" . """ " . "/DISCONNECT")   
	MsgBox, You are successfully disconnected from %connection%.
}
else 
{
	Drive, Eject,%1%
	if ( ErrorLevel = 0 )
		sleep 3000

	DUN := StdoutToVar_CreateProcess("RasDial """ . connection . """ " . username . " " . password)
	Loop, Parse, DUN, `n, `r
	{
		If InStr(A_LoopField, "error")
		{
			MsgBox, Error: %DUN%.
			break
		}
		else if InStr(A_LoopField, "Successfully connected to ")
		{
			MsgBox, You are successfully connected to %connection%.
			break
		}
	}
}

ConnectedToInternet(flag=0x40)
{ 
	Return DllCall("Wininet.dll\InternetGetConnectedState", "Str", flag,"Int",0) 
}
