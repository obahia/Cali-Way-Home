colision_list = ds_list_create(); // lista de colisões
hitbox_list = ds_list_create();   // lista de alvos já atingidos

// Detecta colisões com QUALQUER objeto
var c = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, all, false, false, colision_list, false);

if (c > 0)
{
    for (var i = 0; i < ds_list_size(colision_list); i++)
    {
        var target = colision_list[| i];

        // Verifica se o objeto é um inimigo OU o boss
        if (target.object_index == obj_enemy || target.object_index == obj_boss)
        {
            // Evita bater duas vezes no mesmo
            if (!ds_list_find_value(hitbox_list, target))
            {
                ds_list_add(hitbox_list, target);

                with (target)
                {
                    if (object_index == obj_enemy) {
                        life_enemy -= 5;
                    }
                    else if (object_index == obj_boss) {
                        hp -= 5; // ou hp -= 5, dependendo do nome
                    }
                }
            }
        }
    }
}
