var _array = [];
with(oTile)
{
	array_push(_array, id);	
}
if(wiggle_count < array_length(_array))
{
	wiggle(_array[irandom_range(0, array_length(_array) - 1)]);
	wiggle_count++;
}
else
{
	wiggle(oTile);	
	wiggle_count = 0;
}

if(room == rMainMenu)
{
	alarm_set(1, irandom_range(120, 180));
}