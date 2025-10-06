selectable = false;
rewarding = false;
base_money_reward = 5;
total_bonus = 0;
t_bonus = 0;
p_bonus = 0;

reward_count = 0;
array_rewards = [];
buffer = 60;

size = sprite_get_width(spLetterTile);
width = (size + buffer) * (reward_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = (room_height / 2) + 50;

