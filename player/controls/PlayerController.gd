extends Control

@export var player: Player;
signal advance_time(amount: float);

func _ready():
	var callback = Callable(_on_action_button_pressed)
	var nodes = get_tree().get_nodes_in_group("ActionButton");
	for node: ActionButton in nodes:
		node.pressed.connect(callback.bind(node));

func _on_action_button_pressed(actionButton: ActionButton):
	actionButton.execute(player);
	advance_time.emit(0.1);
