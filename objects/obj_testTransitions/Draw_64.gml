/// @description Insert description here
// You can write your code in this editor

//debug
if instance_exists(obj_stController)
{
	if depth < obj_stController.depth
		depth = obj_stController.depth - 1
	
	draw_set_color(c_white)
	draw_set_halign(fa_right)
	draw_text
	(
		camera_get_view_width(view_camera[0]) - 20, 
		20, 
		"OUT: "+string(obj_stController.animType[IS.OUT])+
		"\nIN: "+string(obj_stController.animType[IS.IN])+
		"\nSTATE = "+string(obj_stController._state)+
		"\nSCREENSHOT = "+string(obj_stController._screenshotTaken)+
		"\nDELAY_0 = "+string(obj_stController._delay[0])+
		"\nDELAY_1 = "+string(obj_stController._delay[1])+
		"\nROWS = "+string(obj_stController._checkerAmountRow)+
		"\n0,0 SIZE = "+string(obj_stController._chk_sizeX[14][0])+
		"\nTRANSFORMTYPE = "+string(obj_stController._checkerScaleTransform)+
		"\nPATTERN = "+string(obj_stController._checkerPattern)+
		"\nENDTIME = "+string(obj_stController._checkerEndTimer)
	)
}