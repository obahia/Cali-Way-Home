spd = 5; //velocidade
hspd= 0; //velocidade horizontal
vspd= 0; //velocidade vertical
grv = 0.3; //gravidade
jump_max = 2; //max em jump
jump_count = 0; //contador de jump 


global.life_player = 4 ; //vida do jogador (em mudança)
  
 state = PlayerState.FREE;

 
 enum PlayerState
 {
	FREE,
	FREEZE,
	ATTACK
 }