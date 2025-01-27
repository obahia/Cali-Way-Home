switch(state)
{
	case PlayerState.FREE: PlayerStateFree(); break;
	
	case PlayerState.FREEZE: PlayerStateFreeze(); break;
}

if keyboard_check_pressed(ord("G"))
{
	state = PlayerState.FREEZE;
}
#region //ATAQUE
 
if(key_attack && !atk)
{
	atk = true; 
	atk_time = 10; //duracao do ataque (em ajuste)
	sprite_index = spr_attack; //muda o sprite de ataque
	
	with(obj_enemy)
	{
		if(distance_to_object(other) < other.atk_rg)
		{
			life_enemy -= other.atk_dmg; //reduz a vida do inimigo
		}
	}
	
	if(atk)
	{
		atk_time -=1;
		if(atk_time <=0)
		{
			atk = false;
			sprite_index = spr_idle;
		}
	}
}


#endregion