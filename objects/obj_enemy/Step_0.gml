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
	instance_create_layer(x, y, "Effects", obj_effect);
	
}

if state = EnemyState.IDLE
{
	hspd = 0;
	sprite_index = spr_rat_idle;
}

if (life_enemy <= 0) {
    instance_destroy(); // Destrói o inimigo
   
}