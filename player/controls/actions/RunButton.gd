extends ActionButton

func execute(player: Player):
	var speed = %MoveSpeed.value / 100.0;
	player.move_forward(speed);
