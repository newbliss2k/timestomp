draw_set_font(f_retroville)
draw_set_color(c_white)

draw_text(0,0,"slipping="+string(o_mainchara.slipping))
draw_text(0,20,"on_ground="+string(o_mainchara.on_ground))

with o_mainchara {
o_handler.pla=place_meeting(x+1,y,o_solid)
}

draw_text(0,40,"place_meeting="+string(pla))
draw_text(0,60,"right pressed="+string(keyboard_check(global.key.right)))
draw_text(0,80,"x_dir="+string(o_mainchara.x_dir))
draw_text(0,100,"x_speed="+string(o_mainchara.x_speed))
draw_text(0,120,"y_speed="+string(o_mainchara.y_speed))

// cursor

window_set_cursor(cr_none)
draw_sprite_ext(s_cursor,-1,mouse_x*3,mouse_y*3,3,3,0,c_white,1)