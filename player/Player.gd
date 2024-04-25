extends CharacterBody2D
class_name Player

const SPEED = 800.0
const JUMP_VELOCITY = 400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity");

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
		velocity.y += gravity * delta

	if (is_on_floor()):
		if do_jump:
			do_jump = false;
			velocity += do_jump_vector * JUMP_VELOCITY;
		elif abs(do_move) > 0:
			var direction = do_move * facing;
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

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
