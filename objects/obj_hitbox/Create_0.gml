colision_list = ds_list_create(); //LISTA DE COLISAO 
hitbox_list = ds_list_create(); //LISTA DOS OBJETOS JA VERIFICADOS
var c  = instance_place_list(x,y, obj_enemy,colision_list,false)

if(c > 0)
{
	for(var i = 0; i < ds_list_size(colision_list);i++)
	{
		var target = colision_list[| i ];
		if(!ds_list_find_value(hitbox_list,target))
		{
			ds_list_add(hitbox_list,target);
			with(target)
			{
				life_enemy -= 5;
              
			}
		}
	}
}