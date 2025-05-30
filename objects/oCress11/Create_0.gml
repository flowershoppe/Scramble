name = "Cress";
spr = spCress;
//_board_w, _board_h, _point_min, _point_max, _turn_min, _turn_max
match_specs = [5, 9, 25, -1, -1, 6];

reward_type = oTile;
reward_amount = 3;

dialogues =
[
	["[chr:Cress][ts:normal]Glad to see you're okay.",
	"[chr:Cress][ts:normal]Will you help me with my work?",
	"[method:match_start]"],

	["[chr:Cress]You're doing better than I thought you would be.",
	"[method:show_results]"]
]