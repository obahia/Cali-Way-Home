spd = 5; //velocidade
hspd= 0; //velocidade horizontal
vspd= 0; //velocidade vertical
grv = 0.3; //gravidade
atk = false; //esta atacando
atk_time = 0; //temporaizador do ataque
atk_cdw = 1; //cooldown do ataque
atk_dmg = 1; //dano do ataque
atk_rg = 40; //alcance do ataque
global.life_player = 4 ; //vida do jogador (em mudança)
  
 state = PlayerState.FREE;
 
 enum PlayerState
 {
	FREE,
	FREEZE
 }