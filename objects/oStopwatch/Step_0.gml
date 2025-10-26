event_inherited();

if(array_contains(oCharmManager.charms, id) and !has_increased and instance_exists(oMatchManager))
{
	oMatchManager.turn_max += 1;
	has_increased = true;
}
else if(!instance_exists(oMatchManager))
{
	has_increased = false;	
}