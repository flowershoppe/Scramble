function reward(_count, _obj)
{
	with(oRewardsManager)
	{
		reward_type = _obj;
		reward_count = _count;
		event_user(0);
	}
}