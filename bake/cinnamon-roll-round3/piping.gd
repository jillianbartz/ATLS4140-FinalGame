extends Area2D

var is_dragging = false
var offset = 0

var reset

func _ready() -> void:
	reset = false

func _process(delta: float) -> void:
	if(reset):
		is_dragging = false
		global_position = Vector2(737, 91)
	elif(is_dragging):
		global_position = get_global_mouse_position() - offset

func _input(event: InputEvent) -> void:
	if(!reset):
		if (event.is_action_pressed("Attack")):
			is_dragging = true
			offset = get_global_mouse_position() - global_position
		elif (event.is_action_released("Attack")):
			is_dragging = false
