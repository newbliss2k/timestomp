if keyboard_check_pressed(vk_escape) {
	game_end()
}

if keyboard_check_pressed(ord("R")) {
	x=mouse_x
	y=mouse_y
}

xorigin=sprite_get_xoffset(sprite_index)
yorigin=sprite_get_yoffset(sprite_index)
sprite_set_bbox(sprite_index,xorigin-sprite_bbox_width/2,yorigin-sprite_bbox_height,xorigin+sprite_bbox_width/2-1,yorigin-1)

// x movement

x_dir=keyboard_check(global.key.right)-keyboard_check(global.key.left)
if !(x_dir=0) sprite_dir=x_dir

on_ground=place_meeting(x, y + 1, o_solid)

if slipping_coyot_timer<1 slipping=0
if ((place_meeting(x+x_dir,y,o_solid)) & (keyboard_check(global.key.right)) & (on_ground=0)) {
	slipping=-x_dir
} else if !((place_meeting(x+1,y,o_solid)) || (place_meeting(x-1,y,o_solid))) {
	slipping_coyot_timer=slipping_coyot_time
}
slipping_coyot_timer--


if ((!(slipping=0)) & (keyboard_check_pressed(global.key.up))) {
	x_speed=x_slip_power*slipping
	y_speed=-y_slip_power
}

switch x_dir {
	case 0:
	x_speed=lerp(x_speed,0,x_velocity/8)
	x_speed_incr=0
	break;
	
	case 1:
	if x_speed<x_speed_max {
		if x_speed<0 {
			x_speed=lerp(x_speed,x_speed_max*x_dir,x_velocity/8)
		} else x_speed=lerp(x_speed,x_speed_max*x_dir,x_velocity/4)
		x_speed_incr=1
	}
	break;
	
	case -1:
	if x_speed>-x_speed_max {
	if x_speed>0 {
			x_speed=lerp(x_speed,x_speed_max*x_dir,x_velocity/8)
		} else x_speed=lerp(x_speed,x_speed_max*x_dir,x_velocity/4)
		x_speed_incr=1
	}
	break;
}

if (!place_meeting(x + x_speed, y, o_solid)) {
	x+=x_speed
} else {
	while (!place_meeting(x + sign(x_speed), y, o_solid)){
		x+=sign(x_speed)
	}
	x_speed=0
}

// y movement

coyot_timer--
if coyot_timer<0 coyot_timer=0

if ((on_ground) || (coyot_timer>0)) {
	if (keyboard_check(global.key.up)) {
		y_speed = jump_impulse
	}
}

if (!place_meeting(x,y+y_speed,o_solid)) {
	y += y_speed
} else {
	while (!place_meeting(x,y+sign(y_speed),o_solid)) {
		y += sign(y_speed)
	}
	y_speed=0
}

y_speed+=y_velocity
if y_speed>y_speed_max y_speed=y_speed_max

on_ground=place_meeting(x, y + 1, o_solid)
if on_ground {
	coyot_timer=coyot_time
}

// animations

image_xscale=sprite_dir

if !(slipping=0) {
	sprite_index=s_wallslip
} else
if on_ground {
	/*if idle_to_run_complete {
		sprite_index=s_mainchara_run
		idle_to_run_complete=0
	}
	if run_to_idle_complete {
		sprite_index=s_mainchara
		run_to_idle_complete=0
	}*/

	if ((x_speed_incr=1) & !(sprite_index=s_mainchara_idle_to_run || sprite_index=s_mainchara_run)) {
		sprite_index=s_mainchara_idle_to_run
	}

	if ((x_speed_incr=0) & !(sprite_index=s_mainchara_run_to_idle || sprite_index=s_mainchara)) {
		sprite_index=s_mainchara_run_to_idle
	}

	if ((sprite_index=s_mainchara_idle_to_run) & (image_index=3)) {
		sprite_index=s_mainchara_run
	}
	if ((sprite_index=s_mainchara_run_to_idle) & (image_index=4)) {
		sprite_index=s_mainchara
	}
} else {
	if y_speed>0 sprite_index=s_mainchara_jump
	if y_speed<0 sprite_index=s_mainchara_fall
}

// attack

if attack_timer<1 {
	if mouse_check_button_pressed(mb_left) {
		attack_dir=point_direction(x,y-10,mouse_x,mouse_y)
		x_speed+=attack_speed*dcos(attack_dir)
		y_speed-=attack_speed*dsin(attack_dir)
		instance_create_depth(x,y-10,-1,o_slash)
		
	}
	
}