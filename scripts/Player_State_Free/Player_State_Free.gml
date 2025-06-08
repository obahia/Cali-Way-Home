function Player_State_Free() {
    if (move_checkpoint == true) {
        exit;
    }

    script_execute(get_input);

    #region INPUT E MOVIMENTO
    var move = key_right - key_left;
    hspd = move * spd;

    // WALL SLIDE CHECK
    var touching_wall_left = place_meeting(x - 1, y, obj_wall);
    var touching_wall_right = place_meeting(x + 1, y, obj_wall);
    var is_in_air = !place_meeting(x, y + 1, obj_wall);

    if (is_in_air && ((key_left && touching_wall_left) || (key_right && touching_wall_right))) {
        is_wall_sliding = true;
        vspd = min(vspd + grv, wall_slide_speed); // gravidade controlada
    } else {
        is_wall_sliding = false;
        vspd += grv; // gravidade normal
    }

    // Flip sprite na parede
    if (is_wall_sliding) {
        sprite_index = spr_wall_slide;
        if (touching_wall_left) {
            image_xscale = 1;
        } else if (touching_wall_right) {
            image_xscale = 1;
        }
    }

    if (hspd != 0) image_xscale = sign(hspd);

    // HORIZONTAL COLISION
    if (place_meeting(x + hspd, y, obj_wall)) {
        while (!place_meeting(x + sign(hspd), y, obj_wall)) {
            x += sign(hspd);
        }
        hspd = 0;
    }
    x += hspd;

    // VERTICAL COLISION
    if (place_meeting(x, y + vspd, obj_wall)) {
        while (!place_meeting(x, y + sign(vspd), obj_wall)) {
            y += sign(vspd);
        }
        vspd = 0;
        jump_count = 0;
    }
    y += vspd;
    #endregion

    #region PULO
    // Reset jumps when on ground
    if (place_meeting(x, y + 1, obj_wall)) {
        jumps = jump_max;
    }

    // WALL JUMP - NOVO!
    if (is_wall_sliding && key_jump) {
        // Determine a direção do pulo (oposta à parede)
        var jump_dir = 0;
        if (touching_wall_left) {
            jump_dir = 1; // pula para direita
        } else if (touching_wall_right) {
            jump_dir = -1; // pula para esquerda
        }
        
        // Aplica o pulo
        vspd = wall_jump_height; // altura do pulo na parede
        hspd = jump_dir * wall_jump_hspd; // impulso horizontal
        
        // Sai do wall slide
        is_wall_sliding = false;
        
        // Ativa o sprite de pulo
        sprite_index = spr_jump;
    }
    // Normal jump
    else if (jumps > 0 && key_jump) {
        jumps -= 1;
        vspd = jump_height;
    }
    #endregion

    #region ATAQUE
    if (key_attack) {
        image_index = 0;
        state = PlayerState.ATTACK;
    }
    #endregion

    #region SPRITE

    if (is_wall_sliding) {
        sprite_index = spr_wall_slide;
    } else if (!place_meeting(x, y + 1, obj_wall)) {
        if (vspd > 0) {
            sprite_index = spr_fall;
        } else if (vspd < 0) {
            if (jumps == jump_max - 1) {
                sprite_index = spr_jump;
            } else {
                sprite_index = spr_doublejump;
            }
        }
    } else {
        if (hspd != 0) {
            sprite_index = spr_run;
        } else {
            sprite_index = spr_idle;
        }
    }
    #endregion
} 