extends ActionButton
# 70, 40, 20, 10
var labels = {
	70: "Sprint",
	40: "Run",
	20: "Jog",
	10: "Walk"
};

func execute(player: Player):
	var speed = %MoveSpeed.value / 100.0;
	player.move_forward(speed);

func _on_move_speed_value_changed(value: float):
	for threshold in labels:
		if (value < threshold):
			continue;
		text = labels[threshold];
		return;
	text = "Walk";
