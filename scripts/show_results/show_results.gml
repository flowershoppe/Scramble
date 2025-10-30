function show_results()
{
	oRun.levels_completed++;
	oTilebag.yui_tiles = oTilebag.tiles;
	reset_tilebag();
	room_persistent = false;
	screenTransition(rResults, , ST_CHECKER_DIAG_UL_TO_DR_Y);
}