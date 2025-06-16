spd = 2.5;
hspd = 0;
vspd = 0;
grv = 0.4;
hp = 10;
hp_max = 10;
show_bar = false; 
distance = 300;
cooldown = 0;
decision_timer = irandom_range(60, 120);
is_dying = false;

image_speed = 0.6;

state = BossState.FREE;

enum BossState
{
	FREE,
	CHASE,
	ATTACK,
	DEAD,
}