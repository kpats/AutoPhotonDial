SetWorkingDir %A_ScriptDir%

InputBox, KeyLetter, AutoPhotonDial, Please enter the Shortcut key for Ctrl + Alt + "Key" Combination, , 310, 140

FileCreateShortcut, %A_ScriptDir%/AutoPhotonDial.exe, %A_Desktop%/AutoPhotonDial.lnk, , , Author:Karan, , %KeyLetter%



