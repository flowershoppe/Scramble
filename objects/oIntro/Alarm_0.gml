wait = false;
alarm_set(2, 180);
audio_play_sound_on(oGame.emitter_SE, msWinChime, false, 1);
sprite_prefetch_multi([spLetterTile]);