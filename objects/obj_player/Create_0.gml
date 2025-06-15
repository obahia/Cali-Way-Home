spd                  = 5;     //velocidade
hspd                 = 0;     //velocidade horizontal
vspd                 = 0;     //velocidade vertical
grv                  = 0.3;   //gravidade
jumps                = 0;     //quantidade de jumps
jump_max             = 2;     //max em jump
jump_height          = -7.7;  //altura do jump
move_checkpoint      = false; //verificacao do checkpoint
is_taking_damage     = false; //tomando dano
damage_knockback_x   = 0;     //knockback x 
damage_knockback_y   = 0;     //knockback y
can_take_damage      = true;  //verificar se pode tomar dnao
invincible_timer     = 0;     //tempo de invicibilidade
is_wall_sliding      = false; //verificar se esta deslizando
wall_slide_speed     = 1.5;   //velocidade do wall slide
wall_jump_height     = -7;    // Altura do pulo (negativo para pular para cima)
wall_jump_hspd       = 8;     
life_max             = 4 ;    //vida do jogador (em mudança)
life                 = life_max;
state                = PlayerState.FREE;

 
 
 
 
 enum PlayerState
 {
	FREE,
	FREEZE,
	ATTACK,
	
 }