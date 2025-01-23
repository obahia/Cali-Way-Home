/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _cam_x = camera_get_view_x(view_camera[0]);

layer_x("bg_2", _cam_x * 0.05);
layer_x("bg_3", _cam_x * 0.1);
layer_x("bg_4", _cam_x * 0.15);
layer_x("bg_5", _cam_x * 0.2);

show_debug_message("Posicao da camera x: " + string(_cam_x));