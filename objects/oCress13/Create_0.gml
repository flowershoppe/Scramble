name = "Cress";
spr = spCress;
//_board_w, _board_h, _point_min, _point_max, _turn_min, _turn_max
match_specs = [7, 7, 1, -1, -1, 6];

reward_type = oCharm;
reward_amount = 5;

dialogues =
[
	["[chr:Cress][ts:normal]Glad to see you're okay.",
	"[chr:Cress][ts:normal]Will you help me with my work?",
	"[method:match_start]"],

	["[chr:Cress]You're doing better than I thought you would be.",
	"[method:show_results]"]
]