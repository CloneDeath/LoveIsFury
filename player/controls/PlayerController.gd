extends Control

@export var player: Player;
@export var preview: PlayerPreview;
signal advance_time(amount: float);

func _ready():
	var executeCallback = Callable(_on_action_button_pressed)
	var hoverCallback = Callable(_on_action_button_hovered)
	var nodes = get_tree().get_nodes_in_group("ActionButton")\
		.filter(func (n): return self.is_ancestor_of(n));
	for node: ActionButton in nodes:
		node.pressed.connect(executeCallback.bind(node));
		node.mouse_entered.connect(hoverCallback.bind(node));

	var proxies = get_tree().get_nodes_in_group("ActionProxy")\
		.filter(func (p): return self.is_ancestor_of(p));
	for proxy in proxies:
		proxy.connect("trigger_action_preview", _on_action_button_hovered);

func _on_action_button_pressed(actionButton: ActionButton):
	player.clear();
	actionButton.execute(player);
	advance_time.emit(0.1);

func _on_action_button_hovered(actionButton: ActionButton):
	player.clear();
	actionButton.execute(player);
	preview.reset();
	actionButton.execute(preview);
