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
		 jump_count = 0;
    }
    y += vspd;

// JUMP
if (key_jump && jump_count < jump_max) { 
    vspd = -8; // Ajuste a força do pulo conforme necessário
    jump_count++; // Incrementa o contador de pulos
}
	// ATAQUE
	
	if(key_attack)  {
	image_index = 0;
	state = PlayerState.ATTACK
	
	}
    #endregion

 #region CHANGE SPRITE
if (hspd != 0) image_xscale = sign(hspd);

if (!place_meeting(x, y + 1, obj_wall)) { 
    if (vspd > 0) { 
        sprite_index = spr_fall; // Caindo
    } else if (vspd < 0) { 
        if (jump_count == 2) { 
            sprite_index = spr_jump; // Se for o segundo pulo, usa o sprite de double jump
        } else { 
            sprite_index =spr_doublejump ; // Se for o primeiro pulo, usa o sprite normal
        }
    }
} else { 
    if (hspd != 0) {
        sprite_index = spr_run; // Correndo
    } else {
        sprite_index = spr_idle; // Parado
    }
}
#endregion


  
}