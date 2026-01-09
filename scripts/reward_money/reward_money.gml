function reward_money()
{
	var _o = oRewardsManager;
	var _m = oMatchManager;
	
	instance_create_layer(0, 0, "YUI", yui_document,
		{
			data_context: oRewardsManager,
			yui_file: "YUI screens/moneyrewards.yui"
		});
	with(_o)
	{
		p_bonus = 0;
		t_bonus = 0;
		l_bonus = 0;
		total_bonus = 0;
		if(_m.turn_min > -1 and _m.turn_max > -1 and (_m.turn_min == _m.turn_max))
		{
			l_bonus = 2;
		}
		else if(_m.point_max > -1)
		{
			p_bonus = 0;//round((_m.point_max - _m.total_points) / 5);
		}
		else if(_m.turn_max > -1)
		{
			t_bonus = (_m.turn_max - _m.turn) * t_bonus_mult;
		}
		total_bonus += base_money_reward + p_bonus + t_bonus + l_bonus;
	}
	
	oPlayer.money += total_bonus;
}