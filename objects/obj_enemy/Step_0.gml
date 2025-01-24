switch(state)
{
	case EnemyState.IDLE: Enemy_State_Idle(); break;
	
	case EnemyState.CHASE: Enemy_State_Chase(); break;
	
	case EnemyState.ATTACK: Enemy_State_Chase(); break;
}