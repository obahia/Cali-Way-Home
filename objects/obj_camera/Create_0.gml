target_ = obj_player;
// Define a resolução base da câmera (o que será visível na tela)
global.base_width = 960;
global.base_height = 540;

// Obtém a resolução do monitor
var screen_width = display_get_width();
var screen_height = display_get_height();

// Calcula o fator de escala para manter a proporção correta
var scale_factor = min(screen_width / global.base_width, screen_height / global.base_height);

// Ajusta o tamanho da janela e a aplicação para manter a proporção
window_set_size(global.base_width * scale_factor, global.base_height * scale_factor);
surface_resize(application_surface, global.base_width, global.base_height);
display_set_gui_size(global.base_width, global.base_height);

// Cria e configura a câmera
var cam = camera_create_view(0, 0, global.base_width, global.base_height, 0, obj_player, -1, -1, -1, -1);
view_camera[0] = cam;
camera_set_view_size(cam, global.base_width, global.base_height);
view_enabled = true;
view_set_camera(0, cam);


