extends CharacterBody2D

@export var speed = 300
@export var direction = Vector2(-1,0)

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position.y = randf_range(0,680)
	global_position.x = randf_range(1150, 4000)
	print(global_position.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Chef")):
		queue_free()
