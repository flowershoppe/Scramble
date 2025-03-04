if((input_check_pressed("confirm") or input_mouse_check_pressed(mb_left))
	and !oRewardsManager.rewarding)
{	
	instance_destroy(oOpponent);
	
	//go to rewards
	reward(1, oCharm);
}