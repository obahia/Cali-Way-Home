switch(state)
{
	case EnemyState.IDLE: Enemy_State_Idle(); break;
	
	case EnemyState.CHASE: Enemy_State_Chase(); break;
	
	case EnemyState.ATTACK: Enemy_State_Chase(); break;
}

if state = EnemyState.ATTACK
{
	
	hspd =0;
	sprite_index = spr_rat_attack;	
    
	
}

if state = EnemyState.IDLE
{
	hspd = 0;
	sprite_index = spr_rat_idle;
}

if (global.life_enemy <= 0) {
    instance_destroy(); // Destrói o inimigo
   
}