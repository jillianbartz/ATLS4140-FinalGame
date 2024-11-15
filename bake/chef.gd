extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_dir = Vector2(0,0)
	if abs(get_global_mouse_position().y - global_position.y) > 5:
		var y_pos = sign(get_global_mouse_position().y - global_position.y)
		input_dir = Vector2(0, y_pos)
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
