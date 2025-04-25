sprite_index = spLetterTile;
icon = spExclamation;
iconc = c_red;

reward_amount = 3;

//assign random opponent of appropriate tier
opponent = oGame.opponents_1[irandom_range(0, array_length(oGame.opponents_1) - 1)];