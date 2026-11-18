// =================== MORTE ===================
if (is_dying) {
    sprite_index = spr_boss_death;
    image_speed = 0.5;

    if (image_index >= image_number - 1) {
        instance_destroy();
		room_restart();
    }
    exit;
}

// =================== VIDA E MORTE ===================
if (hp <= 0) {
    is_dying = true;
    sprite_index = spr_boss_death;
    image_index = 0;
    image_speed = 0.5;
    hspd = 0;
    vspd = 0;
    effect_create_above(ef_explosion, x, y + 50, 0.3, c_white);
    exit;
}

// =================== IA DO BOSS ===================
switch (state) {
    case BossState.FREE:
        Boss_State_Free();
        break;

    case BossState.CHASE:
        Boss_State_Chase();
        break;

    case BossState.ATTACK:
        Boss_State_Attack();
        break;

    case BossState.DEAD:
        
        break;
}

// =================== DANO AO PLAYER ===================
if (place_meeting(x, y, obj_player)) {
    if (!cooldown && obj_player.can_take_damage) {
        obj_player.life -= 1;
        cooldown = 20;
        audio_play_sound(snd_hit1, 0, false);
        audio_play_sound(snd_hit2, 1, false);

        // Knockback
        with (obj_player) {
            is_taking_damage = true;
            image_index = 0;
            var dir = sign(x - other.x);
            damage_knockback_x = 15 * dir;
            damage_knockback_y = -6;
            can_take_damage = false;
        }

        if (obj_player.life <= 0) {
            room_restart();
        }
    }
}

// =================== INVULNERABILIDADE ===================
if (cooldown > 0) {
    cooldown -= 1;
}

