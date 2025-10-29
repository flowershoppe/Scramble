function show_results()
{
	oRun.levels_completed++;
	oTilebag.yui_tiles = oTilebag.tiles;
	reset_tilebag();
	room_persistent = false;
	room_goto(rResults);
}