function PlayerStateFree() {
    script_execute(get_input);
    
	#region MOVIMENT
var move = key_right - key_left

hspd = move * spd;

vspd = vspd + grv;

if(hspd !=0) image_xscale = sign(hspd);

//HORIZONTAL COLISION

if place_meeting(x + hspd,y,obj_wall)
{
	while(!place_meeting(x + sign(hspd),y,obj_wall))
	{
		x = x + sign(hspd)
	}
	hspd =0;
}
x += hspd;

//VERTICAL COLISION

if place_meeting(x,y +vspd,obj_wall)
{
	while(!place_meeting(x,y + sign(vspd),obj_wall))
	{
		y += sign(vspd)
	}
	vspd =0;
}
y += vspd;

//JUMP

if place_meeting(x,y+1, obj_wall) and key_jump
{
	vspd -=8;
}
#endregion


//#region //CHANGE SPRITE

//switch (true)
//{
//	case !place_meeting(x,y +1, obj_wall):
//	sprite_index  = spr_jump;
//	break;
	
//	case hspd != 0 && place_meeting(x, y + 1, obj_wall):
//	sprite_index = spr_player;
//	break;
	
//	case hspd == 0 && place_meeting(x, y + 1, obj_wall):
//	sprite_index = spr_idle;
//	break;
//}

//#region //CHANGE SPRITE

//if (!place_meeting(x, y + 1, obj_wall))
//{
//	//se o personagem estiver no ar troca o sprite
//	sprite_index = spr_jump;
//}
//else if (hspd !=0)
//{
//	sprite_index = spr_player;
//}
//if hspd = 0
//{
//	if place_meeting(x,y+1, obj_wall)
//	{
//	sprite_index = spr_idle;
//	}
//}
//if hspd!=0
//{
//	if place_meeting(x, y+1, obj_wall)
//	{
//		sprite_index = spr_player;
//	}
//}

//#endregion

    // --- VERIFICA VIDA ---
    if (global.life < 1) {
        game_restart();
    }
}