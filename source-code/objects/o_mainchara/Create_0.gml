scr_init_keys()

x_speed_max=5
x_velocity=0.5
x_speed=0
x_dir=0

x_speed_incr=0

sprite_dir=1
idle_to_run_complete=0
run_to_idle_complete=0

y_speed_max=5
y_velocity=0.3
y_speed=0
jump_impulse=-5

on_ground=0
coyot_timer=0
coyot_time=10

x_slip_power=6
y_slip_power=6

xorigin=sprite_get_xoffset(sprite_index)
yorigin=sprite_get_yoffset(sprite_index)
sprite_bbox_height=31
sprite_bbox_width=20
sprite_set_bbox(sprite_index,xorigin-sprite_bbox_width/2,yorigin-sprite_bbox_height,xorigin+sprite_bbox_width/2-1,yorigin-1)