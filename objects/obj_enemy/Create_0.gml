spd = 2.5;
hspd = 0;
vspd = 0;
grv = 0.4;
hp = 10;
distance = 300;
life_enemy = 10;
hit_cooldown = 0;
is_dying = false;

image_speed = 0.6;

state = EnemyState.IDLE;

enum EnemyState
{
	IDLE,
	CHASE,
	ATTACK
}