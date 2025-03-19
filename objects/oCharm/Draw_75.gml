if(array_contains(oRewardsManager.array_rewards, object_index))
{
	var _old_color = draw_get_color();
	draw_set_color(color)
	
	draw_self();	
	
	draw_set_color(_old_color)
}