extends CharacterBody2D

@export var speed = 300
@export var direction = Vector2(-1,0)

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position.y = randf_range(0,650)
	global_position.x = randf_range(1150, 4000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.egg_score >= 2):
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Chef")):
		print("egg")
		Global.egg_score += 1
		queue_free()
