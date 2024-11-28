#region CONTROLS
key_right = keyboard_check(ord("D")) //movimentar para direita
key_left = keyboard_check(ord("A"))  //movimentar para esquerda
key_jump = keyboard_check(vk_space)  //pular
#endregion

#region MOVIMENT
var move = key_right - key_left

hspd = move * spd;

vspd = vspd + grv;

if(hspd !=0) image_xscale = sign(hspd)

//HORIZONTAL COLISION

if place_meeting(x + hspd,y,obj_wall)
{
	while(!place_meeting(x + sign(hspd),y,obj_wall))
	{
		x = x + sign(hspd)
	}
	hspd =0;
}
x = x+ hspd;

//VERTICAL COLISION

if place_meeting(x,y+vspd,obj_wall)
{
	while(!place_meeting(x,y + sign(vspd),obj_wall))
	{
		y = y + sign(vspd)
	}
	vspd =0;
}
y = y+ vspd;

//JUMP

if place_meeting(x,y+1, obj_wall) and key_jump
{
	vspd -=8;
}
#endregion


#region //CHANGE SPRITE

if place_meeting(x, y + 1, obj_wall) == false
{
	//se o personagem estiver no ar troca o sprite
	sprite_index = spr_jump;
}
else if (hspd !=0)
{
	sprite_index = spr_player;
}else
{
	sprite_index = spr_idle
}

#endregion

