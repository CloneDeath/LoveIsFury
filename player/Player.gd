extends CharacterBody2D
class_name Player

const SPEED = 100.0
const JUMP_VELOCITY = 400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity");

var walk_dir := 0;
var do_jump := false;
var do_jump_vector := Vector2.ZERO;

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if do_jump and is_on_floor():
		do_jump = false;
		velocity += do_jump_vector * JUMP_VELOCITY;

	var direction = walk_dir;
	if direction:
		velocity.x = direction * SPEED
	elif (is_on_floor()):
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func stop():
	walk_dir = 0;

func walk_right():
	walk_dir = 1;

func walk_left():
	walk_dir = -1;

func jump(vector):
	do_jump = true;
	do_jump_vector = vector;
