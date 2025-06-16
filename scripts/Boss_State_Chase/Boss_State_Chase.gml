function Boss_State_Chase(){
	
  script_execute(get_input);
    
	#region MOVIMENT


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


#endregion
	
	if (hspd !=0) image_xscale =sign(hspd); //TROCA O LADO DO SPRITE
	
	vir = sign(obj_player.x -x);
	hspd = vir * spd;
	
	//SE O RATO ESTIVER LONGE DO JOGADOR ENTAO FIQUE PARADO
	if distance_to_object(obj_player) > distance
	{
		state = BossState.FREE;
	}
	// SE O RATO ESTIVER PERTO DO JOGADOR ENTAO ATAQUE
	if distance_to_object(obj_player) < 1
	{
		state = BossState.ATTACK;
	
	}
}