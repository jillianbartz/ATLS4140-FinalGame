extends Node2D

var can_be_hit = false
var angy = true

func _process(delta: float) -> void:
	$DoughHealth.value = Global.dough_health
	if(angy):
		$DoughArea/Sprite2D/AnimationPlayer.play("Angy")
	else:
		$DoughArea/Sprite2D/AnimationPlayer.play("Vulnerable")

func _on_dough_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (Input.is_action_just_pressed("Attack") && can_be_hit):
		print("Dough hit")
		Global.dough_health -= 1
