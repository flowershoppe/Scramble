function goto_mainmenu()
{
	//destroy run handlers
	instance_destroy(oMatchManager);
	instance_destroy(oMatchGUI);
	instance_destroy(oRun);
	instance_destroy(oTilebag);
	instance_destroy(oCharm);
	instance_destroy(oTile);
	instance_destroy(oPlayer);
	instance_destroy(oCharmManager);
	instance_destroy(oCursor);
	instance_destroy(yui_document);
	instance_destroy(oOpponent);
	instance_destroy(oLevel);
	instance_destroy(oResultsManager);
	instance_destroy(oRewardsManager);
	instance_destroy(oShop);
	
	global.paused = false;
	
	screenTransition(rMainMenu, , ST_CHECKER_DIAG_UL_TO_DR_Y);
}