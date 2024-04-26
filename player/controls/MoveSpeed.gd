extends HSlider

@export var action_button: ActionButton;

signal trigger_action_preview(ActionButton);

func _on_value_changed(value):
	trigger_action_preview.emit(action_button);

func _on_focus_entered():
	trigger_action_preview.emit(action_button);
