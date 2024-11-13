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
	get_tree().change_scene_to_file("res://cinnamon-roll-round1/cinnamon_roll_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://cinnamon-roll-round2/cinnamon_roll_2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://cinnamon-roll-round3/cinnamon_roll_3.tscn")