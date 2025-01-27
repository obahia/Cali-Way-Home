function Player_State_Free() {
    script_execute(get_input);

    #region MOVIMENT
    var move = key_right - key_left;

    hspd = move * spd;
    vspd = vspd + grv;

    if (hspd != 0) image_xscale = sign(hspd);

    // HORIZONTAL COLISION
    if (place_meeting(x + hspd, y, obj_wall)) {
        while (!place_meeting(x + sign(hspd), y, obj_wall)) {
            x = x + sign(hspd);
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
    }
    y += vspd;

    // JUMP
    if (place_meeting(x, y + 1, obj_wall) && key_jump) {
        vspd -= 8;
    }
	// ATAQUE
	
	if(key_attack)  {
	state = PlayerState.ATTACK
	image_index = 0;
	}
    #endregion

    #region CHANGE SPRITE
    if (hspd != 0) image_xscale = sign(hspd);

    if (!place_meeting(x, y + 1, obj_wall)) {
        if (vspd > 0) {
            sprite_index = spr_fall;
        } else if (vspd < 0) {
            sprite_index = spr_jump;
        }
    } else if (hspd != 0) {
        sprite_index = spr_run;
    } else {
        sprite_index = spr_idle;
    }
    #endregion

  
}

