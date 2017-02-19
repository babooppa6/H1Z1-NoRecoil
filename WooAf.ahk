; <COMPILER: v1.1.24.05>
Fileinstall, C:\Users\nicol\Desktop\H1Z1-DEV\H1Z1 SCRIPT - WooAf\AktivIcon.png, AktivIcon.png
Fileinstall, C:\Users\nicol\Desktop\H1Z1-DEV\H1Z1 SCRIPT - WooAf\Tutorial.txt, Tutorial.txt
issuspended := true
isvisible  := true
pic_off = AktivIcon.png
pic_on = 0
Menu, Tray, Icon,,, 1
Menu,Tray,Click,1
IniRead, Key1, Settings.ini, Settings, Suspendbutton, XButton1
IniRead, Key2, Settings.ini, Settings, NoRecoil, Lbutton
IniRead, Key3, Settings.ini, Settings, Rapidfire, XButton2
IniWrite, %Key1%, Settings.ini, Settings, Suspendbutton
IniWrite, %Key2%, Settings.ini, Settings, NoRecoil
IniWrite, %Key3%, Settings.ini, Settings, Rapidfire
Gui, Add, Pic, vPic gMoveGui, % ( issuspended ? pic_off : pic_on )
Gui, Color, #E0FFFF
Gui,+LastFound
winset, transcolor,#E0FFFF
Gui, -Caption -Border -Sysmenu +AlwaysOnTop +ToolWindow
Gui, show, ,
Hotkey, ifwinactive, ahk_exe h1z1.exe
Hotkey, %Key1%, User1
Hotkey, %Key2%, ~$User2
Hotkey, %Key3%, ~$User3
if !isvisible
Gui Hide
return
GuiToggle:
if isvisible
Gui, Hide
else
Gui, Show
return
#ifwinactive ahk_exe h1z1.exe
{
~Tab::
suspend,permit
ToggleSuspend()
suspend
return
~Esc::
suspend,permit
ToggleSuspend()
suspend
return
}
User1:
suspend,permit
ToggleSuspend()
suspend
return
~$User2:
KeyWait %Key2%, T0.2
If (ErrorLevel = 1) {
While GetKeyState(Key2, "P") {
Click
Setmousedelay 130
}
}
return
~$User3:
KeyWait %Key3%, T0.2
If (ErrorLevel = 1) {
While GetKeyState(Key3, "P") {
Click
Setmousedelay 30
}
}
return
#ifwinactive
ToggleSuspend(){
global
issuspended := !issuspended
guicontrol,,Pic, % ( issuspended ? pic_off : pic_on )
}
return
Guiclose:
Exitapp
MoveGui:
PostMessage, 0xA1, 2,,, A
Return