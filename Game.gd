extends Node2D

@export var dynamicEntities: Node2D;
@export var staticEntities: Node2D;

func _ready():
	dynamicEntities.process_mode = Node.PROCESS_MODE_DISABLED;

func _on_player_controller_advance_time(amount):
	dynamicEntities.process_mode = Node.PROCESS_MODE_INHERIT;
	staticEntities.visible = false;
	await get_tree().create_timer(amount).timeout;
	dynamicEntities.process_mode = Node.PROCESS_MODE_DISABLED;
	staticEntities.visible = true;
	staticEntities.propagate_call("reset");
