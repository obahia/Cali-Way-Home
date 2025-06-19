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


  #region DIAOLOGO
  
  if distance_to_object(obj_par_npc) <=10 
  {
	  if keyboard_check_pressed(ord("F"))
	  {
		  var _npc = instance_nearest(x, y, obj_par_npc);
		  var _dialogo = instance_create_layer(x,y, "Dialogo", obj_dialogo);
		  _dialogo.npc_nome = _npc.nome;
	  }
  }
  
  
  #endregion
   #region PULO
// Reset jumps when on ground
if (place_meeting(x, y + 1, obj_wall)) {
    jumps = jump_max;
}

// WALL JUMP - NOVO!
if (is_wall_sliding && key_jump) {
    var jump_dir = 0;
    if (touching_wall_left) {
        jump_dir = 1;
    } else if (touching_wall_right) {
        jump_dir = -1;
    }

    vspd = wall_jump_height;
    hspd = jump_dir * wall_jump_hspd;
    is_wall_sliding = false;
    sprite_index = spr_jump;

    // 🎵 Som de pulo na parede
    audio_play_sound(snd_jump, 1, false);
}
// Normal jump
else if (jumps > 0 && key_jump) {
    jumps -= 1;
    vspd = jump_height;

    // 🎵 Som de pulo normal
    audio_play_sound(snd_jump, 1, false);
}
#endregion


    #region ATAQUE
    if (key_attack) {
        image_index = 0;
        state = PlayerState.ATTACK;
		audio_play_sound(snd_attack, 1, false); // som de ataque
        audio_play_sound(snd_meow_attack, 1, false);    // som da gata miando
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