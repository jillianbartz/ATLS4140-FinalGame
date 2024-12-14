extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Level 2".disabled = true
	$"Level 3".disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.croll_level1):
		$"Level 2".disabled = false
	if(Global.croll_level2):
		$"Level 3".disabled = false

func _on_level_1_pressed() -> void:
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://tutorials/cr_1_tutorial.tscn")

func _on_level_2_pressed() -> void:
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://tutorials/cr_2_tutorial.tscn")

func _on_level_3_pressed() -> void:
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://tutorials/cr_3_tutorial.tscn")
