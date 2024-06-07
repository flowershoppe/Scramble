//-----START GAME-----
var i = 0;

dist_standard(global.tilebag);

//win con test
instance_create_depth(0, 0, -10, oMatchState);
oMatchState.condition_points = 0;
instance_create_depth(0, 0, -9, oMatchStats);

