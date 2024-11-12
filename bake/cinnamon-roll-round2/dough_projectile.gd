extends Node2D

var velocity: Vector2 = Vector2(0,0)

func fire(forward: Vector2, speed: float):
	forward = (forward - global_position).normalized()
	velocity = forward * speed

func _process(delta: float) -> void:
	position += velocity * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Chef") && area.visible == true):
		queue_free()
