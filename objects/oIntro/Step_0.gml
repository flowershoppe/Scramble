if(input_check_pressed("confirm") or input_mouse_check_pressed(mb_left))
{
	screenTransition(rMainMenu, , ST_CHECKER_DIAG_DL_TO_UR_BOTH);
}
if(!wait){alpha += 0.1;}