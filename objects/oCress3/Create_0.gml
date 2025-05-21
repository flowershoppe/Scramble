name = "Cress";
spr = spCress;
//_board_w, _board_h, _point_min, _point_max, _turn_min, _turn_max
match_specs = [8, 6, 100, -1, -1, 5];

dialogues =
[
	["[chr:Cress][ts:normal]This isn't working",
	"[chr:Cress][ts:normal]I need to try something else.",
	"[method:match_start]"],

	["[chr:Cress]I'm running out of options.",
	"[method:show_results]"]	
]