collision_list = ds_list_create();
hitbox_list = ds_list_create();

collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, all, false, false, collision_list, false);

if (ds_list_size(collision_list) > 0)
{
    for (var i = 0; i < ds_list_size(collision_list); i++)
    {
        var target = collision_list[| i];

        if (target.object_index == obj_enemy || target.object_index == obj_boss)
        {
            if (!ds_list_find_value(hitbox_list, target))
            {
                ds_list_add(hitbox_list, target);

               with (target)
{
    if (object_index == obj_enemy)
    {
        life_enemy -= 5;

        var dir = sign(x - other.x);
        hspd = 90 * dir;
        vspd = 0; // sem empurrar pra cima
	
        hit_cooldown = 30;

        audio_play_sound(snd_hit2, 0, false);
    }
    else if (object_index == obj_boss)
    {
        hp -= 5;
    }
}

            }
        }
    }
}

// lembra de limpar a lista no final do frame pra evitar bugs
ds_list_clear(hitbox_list);
ds_list_clear(collision_list);
