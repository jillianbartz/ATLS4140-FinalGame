extends CharacterBody2D

var is_dragging = false

var reset

func _ready() -> void:
	reset = false

func _input(event: InputEvent) -> void:
	if(!reset):
		if (event.is_action_pressed("Attack") && get_global_mouse_position().distance_to(global_position) < 20):
			is_dragging = true
		elif (event.is_action_released("Attack")):
			is_dragging = false


func _process(delta: float) -> void:
	if(reset):
		is_dragging = false
		global_position = Vector2(688, 49)
	elif(is_dragging):
		global_position = get_global_mouse_position()
