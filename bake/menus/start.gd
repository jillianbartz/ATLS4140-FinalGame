extends Node2D

func _on_start_pressed() -> void:
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")
