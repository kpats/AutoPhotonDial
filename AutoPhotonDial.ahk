#NoEnv

SetWorkingDir %A_ScriptDir%
#include StdoutToVar.ahk

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
	if ( GetDriveByLabel("Photon+") )
	{
		Drive, Eject,% GetDriveByLabel("Photon+") 
		if ( ErrorLevel = 0 )
			sleep 3000
	}
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

GetDriveByLabel(p_Label)
{
  DriveGet, l_Temp, List
  Loop, Parse, l_Temp
  {
	DriveGet, l_Temp, Label, %A_LoopField%:
	If ( l_Temp = p_Label )
	  Return A_LoopField
  }
}