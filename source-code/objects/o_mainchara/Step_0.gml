if keyboard_check(global.key.left) {
	
	xvel-=spd
	if xvel<-xvel_max xvel=-xvel_max
	
}

if keyboard_check(global.key.right) {
	
	xvel+=spd
	if xvel>xvel_max xvel=xvel_max
	
}

if ((!keyboard_check(global.key.left)) & (!keyboard_check(global.key.right))) {
	
	if xvel>0 xvel-=spd/2
	if xvel<0 xvel+=spd/2
	
}

if ((place_meeting(x+1,y,o_solid)) & (de))

x+=xvel