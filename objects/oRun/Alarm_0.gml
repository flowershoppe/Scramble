//new run
instance_create_layer(100, 450, "Tilebag", oTilebag);
dist_standard(oTilebag);
	
//initialize handlers
instance_create_layer(0, 0, "Meta", oCharmManager);
instance_create_layer(0, 0, "Meta", oMatchManager);

//generate shop
with(oShop){event_user(0);}

//initialize player and cursor
instance_create_layer(0, 0, "Meta", oPlayer);	

//levels
if(room == rMap)
{
	if(!instance_exists(oLevel))
	{
		instance_create_layer(room_width * 0.25, room_height * 0.75, "YUI", oLevel1, {active : true});
		instance_create_layer(room_width * 0.6, room_height * 0.3, "YUI", oLevel2, {active : false});
	}	
}

save_game();