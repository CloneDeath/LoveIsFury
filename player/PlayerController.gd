extends Control

@export var player: Player;
signal advance_time(amount: float);

func _on_walk_right_pressed():
	player.walk_right();
	advance_time.emit(0.1);

func _on_walk_left_pressed():
	player.walk_left();
	advance_time.emit(0.1);

func _on_jump_pressed():
	player.jump();
	advance_time.emit(0.1);
