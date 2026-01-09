event_inherited();

if(!has_increased and array_contains(oCharmManager.charms, id))
{
	oRewardsManager.t_bonus_mult *= 2;
	has_increased = true;
}