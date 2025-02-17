switch(state)
{
	case EnemyState.IDLE: Enemy_State_Idle(); break;
	
	case EnemyState.CHASE: Enemy_State_Chase(); break;
	
	case EnemyState.ATTACK: Enemy_State_Attack(); break;
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

if (life_enemy <= 0) {
    instance_destroy(); // Destrói o inimigo
   
}

if (place_meeting(x, y, obj_player)) // Verifica colisão com o player
{
    if (!hit_cooldown) { // Evita perder várias vidas instantaneamente
        global.life -= 1; // Remove 1 vida do jogador
        hit_cooldown = 30; // Define um tempo de invulnerabilidade (30 frames)

        if (global.life <= 0) {
            room_restart(); // Reinicia o jogo se a vida chegar a 0
        }
    }
}

// Controle do tempo de invulnerabilidade
if (hit_cooldown > 0) {
    hit_cooldown -= 1;
}