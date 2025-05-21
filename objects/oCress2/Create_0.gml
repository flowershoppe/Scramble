name = "Cress";
spr = spCress;
//_board_w, _board_h, _point_min, _point_max, _turn_min, _turn_max
match_specs = [10, 10, 75, -1, -1, 6];

dialogues =
[
	["[chr:Cress][ts:normal]Why do you look so familiar?",
	"[chr:Cress][ts:normal]I don't think we've met.",
	"[method:match_start]"],

	["[chr:Cress]...Who are you?",
	"[method:show_results]"]	
]