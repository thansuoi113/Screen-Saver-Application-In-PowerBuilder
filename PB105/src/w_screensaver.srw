$PBExportHeader$w_screensaver.srw
forward
global type w_screensaver from window
end type
type dw_1 from datawindow within w_screensaver
end type
end forward

global type w_screensaver from window
integer x = 832
integer y = 360
integer width = 1934
integer height = 1264
boolean border = false
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 134217729
dw_1 dw_1
end type
global w_screensaver w_screensaver

type prototypes
Function uLong SystemParametersInfoA  (ulong uAction , ulong uparam, string lpvParam, ulong fuWinIni )  Library "User32.dll" alias for "SystemParametersInfoA;ansi"
end prototypes
type variables
Integer SPI_SCREENSAVERRUNNING = 97 

end variables
event resize;dw_1.Resize(this.WorkSpaceWidth(), this.WorkSpaceHeight())
end event

on w_screensaver.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_screensaver.destroy
destroy(this.dw_1)
end on

event open;Environment	le_Env
GetEnvironment(le_Env)
This.Width  =  PixelsToUnits(le_Env.ScreenWidth  + 128, XPixelsToUnits!)
This.Height =  PixelsToUnits(le_Env.ScreenHeight + 128, YPixelsToUnits!)
This.X =  - 64
This.Y =  - 64
This.SetPosition(TopMost!)
Integer i_ret

i_ret = SystemParametersInfoA(SPI_SCREENSAVERRUNNING, 1, "", 0)
end event

event close;Integer i_ret 
i_ret = SystemParametersInfoA(SPI_SCREENSAVERRUNNING, 0, "", 0)
end event

type dw_1 from datawindow within w_screensaver
integer width = 1499
integer height = 992
integer taborder = 1
boolean enabled = false
string dataobject = "d_screen_saver"
end type

