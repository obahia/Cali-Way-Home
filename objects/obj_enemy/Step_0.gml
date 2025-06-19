if (is_dying) {
	    sprite_index = spr_rat_die;
	    image_speed = 0.5;

	    // Quando a animação terminar, destrói
	    if (image_index >= image_number - 1) {
	        instance_destroy();
	    }

	    exit; // Sai do Step pra não continuar executando
	}


switch(state)
{
	case EnemyState.IDLE: Enemy_State_Idle(); break;
	
	case EnemyState.CHASE: Enemy_State_Chase(); break;
	
	case EnemyState.ATTACK: Enemy_State_Attack(); break;
}

if state = EnemyState.ATTACK
{
	
	hspd = 0;
	sprite_index = spr_rat_attack;	
    
	
}

if state = EnemyState.IDLE
{
	hspd = 0;
	sprite_index = spr_rat_idle;
}

	if (life_enemy <= 0) {
		 is_dying = true;
	    sprite_index = spr_rat_die;
	    image_index = 0;
	    image_speed = 0.5;
	    hspd = 0; // para de se mover
	    vspd = 0;
		effect_create_above(ef_explosion, x, y + 50, 0.3, c_white);
	

		exit;// Destrói o inimigo
   
	}

if (place_meeting(x, y, obj_player)) {
    if (!hit_cooldown && obj_player.can_take_damage) {
        obj_player.life -= 0.5;
        hit_cooldown = 30;
		audio_play_sound(snd_hit1, 0, false);
		audio_play_sound(snd_hit2, 1, false);

        
        // Pega posição do player e inimigo (x,y)
        var player_x = obj_player.x;
        var player_y = obj_player.y;
        var enemy_x = x;
        var enemy_y = y;
        
        // Calcula direção do knockback (empurra pra longe do inimigo)
        var knockback_dir_x = -sign(enemy_x - player_x);
        var knockback_dir_y = (enemy_y > player_y) ? -1 : 1;  // pra cima se inimigo estiver abaixo do player, senão pra baixo (ajusta se quiser)
        
        // Define a força do knockback
        var knockback_power_x = 15;
        var knockback_power_y = 6;
        
       with (obj_player) {
    is_taking_damage = true;
    image_index = 0;
    
    var dir = sign(x - other.x); // other.x é do inimigo aqui
    damage_knockback_x = 15 * dir; // empurra pra longe do inimigo
    damage_knockback_y = -6;
    
    can_take_damage = false;
}


        if (obj_player.life <= 0) {
            room_restart();
        }
    }
}


// Controle do tempo de invulnerabilidade
if (hit_cooldown > 0) {
    hit_cooldown -= 1;
}