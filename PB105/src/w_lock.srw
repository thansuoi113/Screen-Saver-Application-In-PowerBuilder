$PBExportHeader$w_lock.srw
forward
global type w_lock from window
end type
type cb_confirm from commandbutton within w_lock
end type
type st_2 from statictext within w_lock
end type
type st_1 from statictext within w_lock
end type
type sle_password from singlelineedit within w_lock
end type
type sle_user from singlelineedit within w_lock
end type
end forward

global type w_lock from window
integer width = 1179
integer height = 476
boolean titlebar = true
string title = "Login To Unlock"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_confirm cb_confirm
st_2 st_2
st_1 st_1
sle_password sle_password
sle_user sle_user
end type
global w_lock w_lock

type variables
int ii_unlock
end variables

on w_lock.create
this.cb_confirm=create cb_confirm
this.st_2=create st_2
this.st_1=create st_1
this.sle_password=create sle_password
this.sle_user=create sle_user
this.Control[]={this.cb_confirm,&
this.st_2,&
this.st_1,&
this.sle_password,&
this.sle_user}
end on

on w_lock.destroy
destroy(this.cb_confirm)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_password)
destroy(this.sle_user)
end on

event timer;Environment	le_Env
GetEnvironment(le_Env)

If Handle(w_lock) > 0 Then
	w_lock.X = Rand(PixelsToUnits(le_Env.ScreenWidth, XPixelsToUnits!)  - This.Width)
	w_lock.Y = Rand(PixelsToUnits(le_Env.ScreenHeight, YPixelsToUnits!) - This.Height)
End If


end event

event open;This.SetPosition(Topmost!)
Timer(6)
sle_user.setfocus( )
ii_unlock = 0
idle(60)
end event

event closequery;if ii_unlock = 0 then
	return 1
end if
	
end event

type cb_confirm from commandbutton within w_lock
integer x = 805
integer y = 256
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Confirm"
boolean default = true
end type

event clicked;If sle_user.Text = "admin" And sle_password.Text = "123456" Then
	ii_unlock = 1
	Close(w_lock)
	Close(w_screensaver)
Else
	Messagebox("Warning","Login Fail")
End If


end event

type st_2 from statictext within w_lock
integer x = 37
integer y = 128
integer width = 261
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_lock
integer x = 37
integer y = 32
integer width = 261
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "User:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_password from singlelineedit within w_lock
integer x = 302
integer y = 128
integer width = 805
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_user from singlelineedit within w_lock
integer x = 302
integer y = 32
integer width = 805
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "admin"
borderstyle borderstyle = stylelowered!
end type

