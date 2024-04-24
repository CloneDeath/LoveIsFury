extends Camera2D

@export var target: Node2D;

func _process(_delta):
	position = target.position;
