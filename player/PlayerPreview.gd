extends Player
class_name PlayerPreview

@export var player: Player;

func _ready():
	$PreviewAnimation.play("default");

func reset():
	position = player.position;
	facing = player.facing;
	velocity = player.velocity;
	do_move = player.do_move;
	do_jump = player.do_jump;
	do_jump_vector = player.do_jump_vector;
	process_mode = Node.PROCESS_MODE_INHERIT;

func freeze():
	process_mode = Node.PROCESS_MODE_DISABLED;
