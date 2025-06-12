
if (instance_exists(obj_player)) {
	var _x = 55;
	var _y = 55;
	var _offset = 70;
	var _life = obj_player.life;
	var _max = obj_player.life_max;

	for (var i = 0; i < _max; i++) {
		var _x1 = _x + (_offset * i);
		
		if (_life >= i + 1) {
			// Coração cheio
			draw_sprite(spr_life, 0, _x1, _y);
		}
		else if (_life > i) {
			// Meio coração
			draw_sprite(spr_half_life, 0, _x1, _y);
		}
		else {
			// Coração vazio
			draw_sprite(spr_nolife, 0, _x1, _y);
		}
	}
}
