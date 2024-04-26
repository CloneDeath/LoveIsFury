extends CharacterBody2D
class_name Player

func get_gravity() -> float:
	return ProjectSettings.get_setting("physics/2d/default_gravity");

func get_move_speed() -> float:
	return 800.0;

func get_jump_speed() -> float:
	return 400.0;

var facing = 1;
var do_move := 0.0;
var do_jump := false;
var do_jump_vector := Vector2.ZERO;
var do_turn_around := false;

func _physics_process(delta):
	if (do_turn_around):
		do_turn_around = false;
		facing *= -1;

	if not is_on_floor():
		velocity.y += get_gravity() * delta

	if (is_on_floor()):
		if do_jump:
			do_jump = false;
			velocity = do_jump_vector * get_jump_speed();
		elif abs(do_move) > 0:
			var direction = do_move * facing;
			velocity.x = direction * get_move_speed()
		else:
			velocity.x = move_toward(velocity.x, 0, get_move_speed())

	move_and_slide();
	%Sprite.scale.x = facing;

func clear():
	do_move = 0;
	do_jump = false;
	do_turn_around = false;

func move_forward(speed: float):
	do_move = speed;

func jump(vector: Vector2):
	do_jump = true;
	do_jump_vector = vector;

func turn_around():
	do_turn_around = true;
