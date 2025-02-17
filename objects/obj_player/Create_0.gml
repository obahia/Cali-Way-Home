spd              = 5;   //velocidade
hspd             = 0;   //velocidade horizontal
vspd             = 0;   //velocidade vertical
grv              = 0.3; //gravidade
jumps            = 0;
jump_max         = 2;   //max em jump
jump_height      = -6.7; //altura do jump




global.life_player = 4 ; //vida do jogador (em mudança)
  
 state = PlayerState.FREE;

 
 enum PlayerState
 {
	FREE,
	FREEZE,
	ATTACK
 }