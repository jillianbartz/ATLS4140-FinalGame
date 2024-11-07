extends CharacterBody2D

@export var speed = 300
@export var direction = Vector2(-1,0)

var y_movement = 0

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(Global.flour_spawn_y >= 600):
		y_movement = -20
	elif( Global.flour_spawn_y <= 50):
		print(y_movement)
		y_movement = 20
	Global.flour_spawn_y += y_movement
	Global.flour_spawn_x += 40
	global_position.y = Global.flour_spawn_y
	global_position.x = Global.flour_spawn_x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.flour_score >= 20):
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Chef")):
		queue_free()
		print("flour")
		Global.flour_score += 1
