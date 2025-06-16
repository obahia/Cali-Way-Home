function Boss_State_Free() {
    // === Referência ao player e distância
    var player = instance_nearest(x, y, obj_player);
    var dist = point_distance(x, y, player.x, player.y);

    // === Condição de morte
    if (hp <= 0) {
        state = BossState.DEAD;
    }

    // === Contadores de tempo
    if (cooldown > 0) cooldown--;
    if (decision_timer > 0) decision_timer--;

    // === Tomada de decisão
    if (decision_timer <= 0 && state != BossState.ATTACK && state != BossState.DEAD) {
        decision_timer = irandom_range(60, 120); // novo tempo de decisão (1–2s)

        if (dist < 100 && cooldown <= 0) {
            var rand = random(1);
            if (rand < 0.5) {
                state = BossState.ATTACK;
                cooldown = 90; // 1.5s
            } else {
                state = BossState.FREE;
            }
        } else {
            var rand = random(1);
            if (rand < 0.6) {
                state = BossState.CHASE;
            } else {
                state = BossState.FREE;
            }
        }
    }

    // === Gravidade
    vspd += grv;

    // === Controle de movimento
    hspd = 0;

    switch (state) {
        case BossState.FREE:
            sprite_index = spr_boss_idle;
            break;

        case BossState.CHASE:
            sprite_index = spr_boss_run;
            hspd = (player.x > x) ? spd : -spd;
            break;

        case BossState.ATTACK:
            sprite_index = spr_boss_attack;

            if (image_index >= image_number - 1) {
                if (place_meeting(x + image_xscale * 10, y, obj_player)) {
                    with (obj_player) {
                        hp -= 1; // aplica dano
                    }
                }
                image_index = 0;
                state = BossState.FREE;
            }
            break;

        case BossState.DEAD:
            sprite_index = sprite_dead;
            hspd = 0;
            vspd = 0;
            break;
    }

    // === Espelhar sprite baseado no movimento
    if (hspd != 0) {
        image_xscale = sign(hspd);
    }

    // === Colisão horizontal
    if (place_meeting(x + hspd, y, obj_wall)) {
        while (!place_meeting(x + sign(hspd), y, obj_wall)) {
            x += sign(hspd);
        }
        hspd = 0;
    }
    x += hspd;

    // === Colisão vertical
    if (place_meeting(x, y + vspd, obj_wall)) {
        while (!place_meeting(x, y + sign(vspd), obj_wall)) {
            y += sign(vspd);
        }
        vspd = 0;
    }
    y += vspd;
}
