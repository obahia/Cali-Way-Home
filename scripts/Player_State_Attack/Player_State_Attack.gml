function Player_State_Attack()
{
	
	if(image_index >2)
	{
	 if (!instance_exists(obj_hitbox)) 
	 {
       instance_create_layer(x +(70 * image_xscale ),y, layer, obj_hitbox)
     }
	 
	}
	
    // Define o sprite de ataque
    sprite_index = spr_attack;
	
    // Quando a animação termina, destruir a hitbox e voltar ao estado normal
    if (image_index >= image_number - 1) 
	{
        if (instance_exists(obj_hitbox)) instance_destroy(obj_hitbox); // Destroi qualquer hitbox existente
        state = PlayerState.FREE; // Volta ao estado normal
    }
}
