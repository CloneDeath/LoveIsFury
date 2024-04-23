extends Control

@export var player: Player;
signal advance_time(amount: float);

func _on_jump_pressed():
	player.stop();
	player.jump(%JumpDirection.vector);
	advance_time.emit(0.1);

func _on_stop_button_pressed():
	advance_time.emit(0.1);

func _on_run_button_pressed():
	var speed = %MoveSpeed.value / 100.0;
	player.move_forward(speed);
	advance_time.emit(0.1);

func _on_turn_around_pressed():
	player.stop();
	player.turn_around();
	advance_time.emit(0.1);
