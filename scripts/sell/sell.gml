function sell(_charm, _value)
{
	oPlayer.money += round(_charm.value / 2);
	array_delete(oCharmManager.charms, array_get_index(oCharmManager.charms, _charm), 1);
	array_push(oCharmManager.charms, -1);
	instance_destroy(_charm);
	audio_play_sound_on(oGame.emitter_SE, sdCoin, false, 1);
}