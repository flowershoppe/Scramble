function _stResetFadeVariables() //for variable reset function
{
	_fadeSpeed = [DEFAULT_FADE_SPEED_0, DEFAULT_FADE_SPEED_1]
	_fadeAccel = [DEFAULT_FADE_ACCEL_0, DEFAULT_FADE_ACCEL_1]
	_fadeAlpha = 0
}

function _stFade(useScreenshot = false, useSprite = false)
{
	switch(_state)
	{
		#region OUT
		case IS.OUT:
		
		if useScreenshot // Do not play animation if surface and is out
			_anim_stateNext()
		else
		{
			switch(_state2) // Increment animation
			{
				case 0: // Set alpha
				_fadeAlpha = 0
				_anim_state2Next()
				break;
			
				case 1: // Increase alpha until it's 1
				if _fadeAlpha < 1
				{
					_fadeAlpha += _fadeSpeed[IS.OUT] // Increment
					_fadeSpeed[IS.OUT] += _fadeAccel[IS.OUT] // Animation speed increase
				}
				else
					_anim_state2Next()
				break;
			
				case 2:
				_anim_stateNext()
				break;
			}
		}
		
		break;
		#endregion
		
		#region IN
		case IS.IN:
		switch(_state2) // Increment animation
		{
			case 0: // Set alpha
			_fadeAlpha = 1
			_anim_state2Next()
			break;
			
			case 1: // Increase alpha until it's 0
			if _fadeAlpha > 0
			{
				_fadeAlpha -= _fadeSpeed[IS.IN] // Increment
				_fadeSpeed[IS.IN] += _fadeAccel[IS.IN] // Animation speed increase
			}
			else
				_anim_state2Next()
			break;
			
			case 2:
			//destroy fade out
			_anim_stateNext()
			break;
		}
		break;

		#endregion
	}
	
	#region Draw
	if useScreenshot // Draw surface sprite
	{
		if sprite_exists(spr_stSurface)
			draw_sprite_ext(spr_stSurface, 0, DEFAULT_X, DEFAULT_Y, 1, 1, 0 , c_white, _fadeAlpha)
	}
	else if useSprite && sprite_exists(_sprite) // Draw transparent sprite
		draw_sprite_ext(sprite_index, 0, DEFAULT_X, DEFAULT_Y, 1, 1, 0 , c_white, _fadeAlpha)
	else
		_anim_drawRectangle(_fadeAlpha) // Draw transparent rectangle
		
	#endregion
}