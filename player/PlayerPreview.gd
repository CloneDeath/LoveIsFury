extends Player
class_name PlayerPreview

@export var player: Player;
@export var time_factor: float = 0.25;
@export var time_slice: float = 0.1;

func get_gravity() -> float:
	return ProjectSettings.get_setting("physics/2d/default_gravity") * time_factor * time_factor;

func get_move_speed() -> float:
	return 800.0 * time_factor;

func get_jump_speed() -> float:
	return 400.0 * time_factor;

func _ready():
	$PreviewAnimation.play("default");
	$PreviewAnimation.speed_scale = time_factor / time_slice;

func reset(reset_animation=true):
	position = player.position;
	facing = player.facing;
	velocity = player.velocity;
	do_move = player.do_move;
	do_jump = player.do_jump;
	do_jump_vector = player.do_jump_vector;
	do_turn_around = player.do_turn_around;
	process_mode = Node.PROCESS_MODE_INHERIT;
	if (reset_animation):
		$PreviewAnimation.seek(0);

func freeze():
	process_mode = Node.PROCESS_MODE_DISABLED;
