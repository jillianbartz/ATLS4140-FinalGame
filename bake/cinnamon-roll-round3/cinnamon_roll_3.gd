extends Node2D
#
#var box = load("res://cinnamon-roll-round3/box.gd").new()
#
#func _ready():
	#add_child(box)

func _on_spiral_area_body_entered(body: Node2D) -> void:
	$Box.reset = true
	$Timer.start(.5)


func _on_timer_timeout() -> void:
	$Box.reset = false


func _on_finish_area_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Spiral_Box")):
		print("won!")
