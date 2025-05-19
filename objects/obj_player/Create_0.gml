spd              = 5;   //velocidade
hspd             = 0;   //velocidade horizontal
vspd             = 0;   //velocidade vertical
grv              = 0.3; //gravidade
jumps            = 0;
jump_max         = 2;   //max em jump
jump_height      = -6.7; //altura do jump
move_checkpoint  = false;
damage_dir       = 0;



life_max = 4 ; //vida do jogador (em mudança)
life = life_max;
 state = PlayerState.FREE;

 
 enum PlayerState
 {
	FREE,
	FREEZE,
	ATTACK,
	DAMAGE
 }