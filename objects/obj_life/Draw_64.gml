
if(instance_exists(obj_player)){
for (var _i = 0; _i < global.life_max; _i++)
{
	var _x = 55;
	var _y = 55;
	var _offset = 70;
	var _x1 = _x + (_offset * _i);
	gpu_set_fog(true,c_black,0,0);
	draw_sprite(spr_life, 0, _x1, _y);
	gpu_set_fog(false,c_black,0,0);
}

for (var _i = 0; _i <global.life; _i++)
{
	var _x = 55;
	var _y = 55;
	var _offset = 70;
	var _x1 = _x + (_offset * _i);
	
	draw_sprite(spr_life, 0, _x1, _y);
	
}

}