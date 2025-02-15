function reward(_count)
{
	var _m = oRewardsManager;
	
	instance_create_layer(0, 0, "YUI", yui_document,
	{
		data_context : _m,
		yui_file : "YUI screens/rewards.yui"
	});
	
	with(oRewardsManager)
	{
		reward_count = _count;
		event_user(0);
	}
}