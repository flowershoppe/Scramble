event_inherited();

if(array_contains(oCharmManager.charms, id) and !has_increased)
{
	oPlayer.hand_size += 1;
	has_increased = true;
}