#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include StdoutToVar.ahk
Drive, Eject,%1%
if ( ErrorLevel = 0 )
	sleep 3000

connection = TATA HSIA
userName = internet
password = internet

DUN := StdoutToVar_CreateProcess("RasDial """ . connection . """ " . username . " " . password)

Loop, Parse, DUN, `n, `r
{
	If InStr(A_LoopField, "already connected to ")
	{
		DUN := StdoutToVar_CreateProcess("RasDial """ . "TATA HSIA" . """ " . "/DISCONNECT")
		MsgBox, You have successfully disconnected to %connection%.
		break
	}
}

Loop, Parse, DUN, `n, `r
{
	If InStr(A_LoopField, "Successfully connected to ")
	{
		MsgBox, You have successfully connected to %connection%.
		break
	}
}


Loop, Parse, DUN, `n, `r
{
	If InStr(A_LoopField, "error")
	{
		MsgBox, Error: %DUN%.
		break
	}
}
