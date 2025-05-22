function Player_State_Attack()
{
    // Adiciona a gravidade
    var gravidade = 0.7;
    vspd += gravidade;

    // Move verticalmente
    y += vspd;

    // Se estiver no chão, zera a velocidade vertical
    if (place_meeting(x, y + 1, obj_wall)) {
        vspd = 0;
    }

    // Cria a hitbox no tempo certo
    if (image_index > 2) {
        if (!instance_exists(obj_hitbox)) {
            instance_create_layer(x + (70 * image_xscale), y, layer, obj_hitbox);
        }
    }

    // Define o sprite de ataque
    sprite_index = spr_attack;

    // Quando a animação termina, destruir a hitbox e voltar ao estado normal
    if (image_index >= image_number - 1) {
        if (instance_exists(obj_hitbox)) instance_destroy(obj_hitbox);
        state = PlayerState.FREE;
    }
}
