var i = 0;

for(i = 0; i < 100; i++)
{
	//populate tilebag with random letters and assign their corresponding point values
	var _rand = chr(irandom_range(ord("A"), ord("Z")))
	var _point = global.letters[? _rand];
	add_tile_to_bag(_rand, _point);
}

for(i = 0; i < global.active_player.hand_size; i++)
{
	add_tile_to_hand(global.active_player.hand, global.tilebag);
}