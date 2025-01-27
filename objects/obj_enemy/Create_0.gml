spd = 3;
hspd = 0;
vspd = 0;
grv = 0.4;
hp = 10;
distance = 300;
life_enemy = 4;

image_speed = 0.6;

state = EnemyState.IDLE;

enum EnemyState
{
	IDLE,
	CHASE,
	ATTACK
}