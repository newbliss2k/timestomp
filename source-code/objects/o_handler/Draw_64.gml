draw_set_font(f_retroville)
draw_set_color(c_white)

draw_text(0,0,"slipping="+string(o_mainchara.slipping))
draw_text(0,10,"on_ground="+string(o_mainchara.on_ground))

with o_mainchara {
o_handler.pla=place_meeting(x+1,y,o_solid)
}

draw_text(0,20,string(pla))
draw_text(0,30,string(keyboard_check(global.key.right)))
draw_text(0,40,string(0))