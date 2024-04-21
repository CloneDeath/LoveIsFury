@tool
extends Control

var magnitude: float:
	get:
		return vector.length();
	set(value):
		_end = _start + (vector.normalized() * value * _vector_scale);

var vector: Vector2:
	get:
		return (_end - _start) / _vector_scale;
	set(value):
		_end = _start + (value * _vector_scale);

var _vector_scale: float:
	get:
		return min(size.x, size.y) / 2;

var _start: Vector2:
	get:
		return $Pointer.points[0];
	set(value):
		$Pointer.points[0] = value;

var _end: Vector2:
	get:
		return $Pointer.points[1];
	set(value):
		$Pointer.points[1] = value;

func _gui_input(event):
	if (event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		_end = event.position;
		_clamp();
	if (event is InputEventMouseMotion and event.button_mask & MOUSE_BUTTON_LEFT):
		_end = event.position;
		_clamp();

func _process(delta):
	_start = size / 2;
	_clamp();

func _clamp():
	magnitude = clamp(magnitude, 0, 1);
	_end = _end.clamp(Vector2(), size);
