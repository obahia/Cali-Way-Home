var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _xx = 32;
var _yy = _guia - 240; // caixa um pouco mais pra cima
var _largura_caixa = _guil - 64;
var _altura_caixa = 200; // aumentada pra caber mais texto

draw_set_font(ft_dialogo);
draw_set_alpha(1);

// Fundo preto
draw_set_color(c_black);
draw_rectangle(_xx, _yy, _xx + _largura_caixa, _yy + _altura_caixa, false);

// Texto branco
draw_set_color(c_white);
draw_set_halign(fa_left);
// draw_set_valign(fa_top); // pode até tirar isso

// Texto com margem interna e quebra horizontal
draw_text_ext(_xx + 16, _yy + 95, texto[pagina], 32, _largura_caixa - 32);
