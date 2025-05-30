name = "The Wiz";
spr = spTheWiz;
//_board_w, _board_h, _point_min, _point_max, _turn_min, _turn_max
match_specs = [9, 9, 50, -1, -1, 7];

reward_type = oTile;
reward_amount = 3;

dialogues =
[
	["[chr:TheWiz][ts:normal]If you wish to [c:orange]advance[c:white], you must [e:floating][c:orange]prove your worth!",
	"[chr:TheWiz][ts:normal]Earn [c:orange]50 points[c:white] in a match. Then, I will [c:orange]permit your passage[c:white].",
	"[chr:TheWiz][ts:normal]...[c:orange][e:waving]BEGIN!",
	"[method:match_start]"],

	["[chr:TheWiz][e:bouncing]Whaaaaat???",
	"[chr:TheWiz]You actually did it?",
	"[chr:TheWiz]That's... great! Umm...",
	"[chr:TheWiz]I'm not actually a wizard though, so I can't grant you passage.",
	"[chr:TheWiz]...",
	"[chr:TheWiz]Good luck!",
	"[method:show_results]"]	
]