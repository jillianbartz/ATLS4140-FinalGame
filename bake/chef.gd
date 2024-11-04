extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_dir = Vector2(0, Input.get_vector("Move Left", "Move Right", "Move Up", "Move Down").y)
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
