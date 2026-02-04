//new run
instance_create_layer(0, 0, "Meta", oDialogueManager);
instance_create_layer(100, 450, "Tilebag", oTilebag);
dist_standard(oTilebag);
	
//initialize handlers
instance_create_layer(0, 0, "Meta", oCharmManager);

//generate shop
instance_destroy(oShop);
instance_create_layer(0, 0, "Meta", oShop);
with(oShop){event_user(0);}

//give random charm
var _num = irandom_range(1, array_length(global.charms) - 1)
var _charm = global.charms[_num];
add_charm(_charm);

create_levels(level_count, oLevel1);
	
save_game();