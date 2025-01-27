// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Player_State_Attack(){
     


    if(!instance_exists(obj_hitbox))
	{
		instance_create_layer(x + (35 * image_xscale), y, layer, obj_hitbox);
	}
   
    sprite_index = spr_attack;
	if(image_index >= image_number - 1 )
	{
		if(instance_exists(obj_hitbox)) instance_destroy(obj_hitbox)
		state = Player_State_Free();
	}
}