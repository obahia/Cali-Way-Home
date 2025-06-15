switch(state)
{
	case BossState.IDLE: Boss_State_Idle(); break;
	
	case BossState.CHASE: Boss_State_Chase(); break;
	
	case BossState.ATTACK: Boss_State_Attack(); break;
}

if state = BossState.ATTACK
{
	
	hspd = 0;
	sprite_index = spr_boss_attack;	
    
	
}


if state = BossState.IDLE
{
	hspd = 0;
	sprite_index = spr_boss_idle;
}
