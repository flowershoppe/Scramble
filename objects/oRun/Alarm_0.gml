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

create_levels(1, oLevel1);

save_game();