if keyboard_check(global.key.left) {
	
	xvel-=0.1
	if xvel<-xvel_max xvel=-xvel_max
	
}

if keyboard_check(global.key.right) {
	
	xvel+=0.1
	if xvel>xvel_max xvel=xvel_max
	
}

if ((!keyboard_check(global.key.left)) & (!keyboard_check(global.key.right))) {
	
	if xvel>0 xvel-=0.05
	if xvel<0 xvel+=0.05
	
}

x+=xvel