extends Node2D

var can_be_hit = false
var angy = true
var peaceful = true

func _ready():
	$DoughArea/Sprite2D/AnimationPlayer.play("Idle")

func _process(delta: float) -> void:
	$DoughHealthTex.value = Global.dough_health
	if(Global.shooting):
		$DoughArea/Sprite2D/AnimationPlayer.play("Attack")
		Global.shooting = false
	elif(angy):
		$DoughArea/Sprite2D/AnimationPlayer.play("Idle")
	else:
		peaceful_anim()

func peaceful_anim():
	if(peaceful):
		peaceful = false
		$DoughArea/Sprite2D/AnimationPlayer.play("Jump")

#func _on_dough_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if (Input.is_action_just_pressed("Attack") && can_be_hit):
		#print("Dough hit")
		#$DoughArea/Sprite2D/AnimationPlayer.play("Damage_Taken")
		#Global.attack_anim = true
		#Global.dough_health -= 1

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "Death"):
		get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")
	if(angy):
		$DoughArea/Sprite2D/AnimationPlayer.play("Idle")
	else:
		$DoughArea/Sprite2D/AnimationPlayer.play("Jump")


func _on_dough_area_mouse_entered() -> void:
	if(can_be_hit):
		print("Dough hit")
		$DoughArea/Sprite2D/AnimationPlayer.play("Damage_Taken")
		Global.attack_anim = true
		Global.dough_health -= .5
