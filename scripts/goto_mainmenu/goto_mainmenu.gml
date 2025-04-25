function goto_mainmenu()
{
	//destroy run handlers
	instance_destroy(oMatchManager);
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
	
	global.paused = false;
	
	with(oGame){alarm_set(0, 1);}
}