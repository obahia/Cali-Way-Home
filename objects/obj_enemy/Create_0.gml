spd = 8;
hspd = 0;
vspd = 0;
grv = 0.4;
hp = 10;
distance = 300;

image_speed = 0.6;

state = EnemyState.IDLE;

enum EnemyState
{
	IDLE,
	CHASE,
	ATTACK
}