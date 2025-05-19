function Player_State_Free() {
	if(move_checkpoint = true)
{
	exit
}

    script_execute(get_input);

    #region MOVIMENTO
    var move = key_right - key_left;

    hspd = move * spd;
    vspd += grv;

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
	
	var collision_e = instance_place(x + hspd, y, obj_enemy)
	if(collision_e)
	{
		hspd = 0
		vspd = 0
		vspd -=4
		damage_dir = point_direction(collision_e.x, collision_e.y, x,y)
		state = PlayerState.DAMAGE
	}
	
	
#endregion
	
    #region PULO
 
   // JUMP
  if (place_meeting(x, y + 1, obj_wall)) { 
    jumps = jump_max;
  }
  if(jumps > 0) && (key_jump)
  {
	jumps -=1;
	vspd = jump_height;
  }
#endregion
	
	#region // ATAQUE
	
	if(key_attack)  {
	image_index = 0;
	state = PlayerState.ATTACK
	
	}
    #endregion

 
   
   #region //CHANGE SPRITE
if (hspd != 0) image_xscale = sign(hspd);

if (!place_meeting(x, y + 1, obj_wall)) { 
    if (vspd > 0) { 
        sprite_index = spr_fall; // Caindo
    } else if (vspd < 0) { 
       if (jumps == jump_max - 1) { 
    sprite_index = spr_jump; //Se já usou um pulo e ainda pode pular, usa o sprite do double jump
} else { 
    sprite_index = spr_doublejump; /// Se for o primeiro pulo, usa o sprite normal
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