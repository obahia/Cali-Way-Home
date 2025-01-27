switch(state)
{
	case PlayerState.FREE: Player_State_Free(); break;
	
	case PlayerState.ATTACK: Player_State_Attack(); break;
	
	case PlayerState.FREEZE: PlayerStateFreeze(); break;
}

if keyboard_check_pressed(ord("G"))
{
	state = PlayerState.FREEZE;
}
