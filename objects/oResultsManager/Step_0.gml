if(room == rResults and (input_check_pressed("confirm") or input_mouse_check_pressed(mb_left))
	and !oRewardsManager.rewarding)
{	
	instance_destroy(oOpponent);
	
	//go to rewards
	reward(oRun.current_level.reward_amount, oRun.current_level.reward_type);
}