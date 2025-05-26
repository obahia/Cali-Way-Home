if (is_taking_damage) {
    can_take_damage = false; // Fica invulnerável enquanto estiver animando o dano

    sprite_index = spr_damage;
    image_speed = 1;

    // Aplica o knockback
    x += damage_knockback_x;
    y += damage_knockback_y;

    damage_knockback_x *= 0.8;
    damage_knockback_y += 0.5;

    if (image_index >= image_number - 1) {
        is_taking_damage = false;
        can_take_damage = true; // Volta a poder levar dano
        sprite_index = spr_idle;
        damage_knockback_x = 0;
        damage_knockback_y = 0;
		
    }

    exit;
}


switch(state)
{
	case PlayerState.FREE: Player_State_Free(); break;
	
	case PlayerState.ATTACK: Player_State_Attack(); break;
	
	case PlayerState.FREEZE: PlayerStateFreeze(); break;
	
	
}

if keyboard_check_pressed(ord("R"))
{
	game_restart();
}

if (invincible_timer > 0) {
    invincible_timer -= 1;
    can_take_damage = false;
} else {
    can_take_damage = true;
}
