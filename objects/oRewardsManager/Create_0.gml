selectable = false;
rewarding = false;

reward_count = 0;
array_rewards = [];
buffer = 60;

size = sprite_get_width(spLetterTile);
width = (size + buffer) * (reward_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = (room_height / 2) + 50;

