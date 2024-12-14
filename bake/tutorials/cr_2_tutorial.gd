extends Node2D

func _on_confirm_pressed() -> void:
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://cinnamon-roll-round2/cinnamon_roll_2.tscn")
