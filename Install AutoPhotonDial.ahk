SetWorkingDir %A_ScriptDir%

InputBox, DriveLetter, AutoPhotonDial, Please enter the drive letter of Tata Photon +..., , 310, 130
InputBox, KeyLetter, AutoPhotonDial, Please enter the Shortcut key for Ctrl + Alt + "Key" Combination, , 310, 140

FileCreateShortcut, %A_ScriptDir%/AutoPhotonDial.exe, %A_Desktop%/AutoPhotonDial.lnk, , "%DriveLetter%", Author:Karan, , %KeyLetter%



