spd                  = 5;   //velocidade
hspd                 = 0;   //velocidade horizontal
vspd                 = 0;   //velocidade vertical
grv                  = 0.3; //gravidade
jumps                = 0;
jump_max             = 2;   //max em jump
jump_height          = -7.7; //altura do jump
move_checkpoint      = false;
is_taking_damage     = false;
damage_knockback_x   = 0;
damage_knockback_y   = 0;
can_take_damage      = true;
invincible_timer     = 0;






life_max = 4 ; //vida do jogador (em mudança)
life = life_max;
 state = PlayerState.FREE;

 
 enum PlayerState
 {
	FREE,
	FREEZE,
	ATTACK,
	
 }