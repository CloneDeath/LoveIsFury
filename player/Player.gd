extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity");

var walk_dir := 0;
var do_jump := false;

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if do_jump and is_on_floor():
		do_jump = false;
		velocity.y = JUMP_VELOCITY;

	var direction = walk_dir;
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func walk_right():
	walk_dir = 1;

func walk_left():
	walk_dir = -1;

func jump():
	do_jump = true;
