spd                  = 5;     //velocidade
hspd                 = 0;     //velocidade horizontal
vspd                 = 0;     //velocidade vertical
grv                  = 0.3;   //gravidade
cooldown = 0;
decision_timer = irandom_range(60, 120); // entre 1s e 2s
hp = 10;

state = BossState.IDLE;

// Estados
enum BossState {
    IDLE,
    CHASE,
    ATTACK,
 
}




// Sprite setup
sprite_idle = spr_boss_idle;
sprite_walk = spr_boss_run;
sprite_attack = spr_boss_attack;
sprite_dead = spr_boss_death;

