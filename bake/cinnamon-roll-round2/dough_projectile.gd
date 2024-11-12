extends Node2D

var velocity: Vector2 = Vector2(0,0)

func fire(forward: Vector2, speed: float):
	forward = (forward - global_position).normalized()
	velocity = forward * speed

func _process(delta: float) -> void:
	position += velocity * delta
