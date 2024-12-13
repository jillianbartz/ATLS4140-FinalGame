extends Node2D

enum States {EGG, FLOUR, BUTTER}

var state: States = States.EGG

var egg = preload("res://cinnamon-roll-round1/egg.tscn")
var flour = preload("res://cinnamon-roll-round1/flour.tscn")
var butter = preload("res://cinnamon-roll-round1/butter.tscn")

var spawned: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match Global.croll_level1_status:
		1: 
			print("Egg")
			state = States.EGG
		2: 
			print("flour")
			state = States.FLOUR
		3: 
			state = States.BUTTER
	$Chef/ChefSprite/AnimationPlayer.play("Idle")
	

func spawn_eggs():
	var egg_duplicates = 0
	while(egg_duplicates < 7):
		var new_egg = egg.instantiate()
		add_child(new_egg)
		egg_duplicates += 1
	spawned = true

func spawn_flour():
	print("spawning flour")
	var flour_duplicates = 0
	while(flour_duplicates < 300):
		var new_flour = flour.instantiate()
		add_child(new_flour)
		flour_duplicates += 1
	spawned = true

func spawn_butter():
	var butter_duplicates = 0
	while(butter_duplicates < 2):
		var new_butter = butter.instantiate()
		add_child(new_butter)
		butter_duplicates += 1
	spawned = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match state:
		States.EGG:
			$Score.text = str(Global.egg_score) + "/5"
			if(!spawned):
				Global.croll_level1_status = 1
				spawn_eggs()
			if(Global.egg_score >= 5):
				spawned = false
				$Chef.global_position.x = 64
				$Chef.global_position.y = 288
				state = States.FLOUR
			elif(Global.egg_amount_missed + Global.egg_score == 7):
				print("missed all")
				spawned = false
				Global.egg_amount_missed = 0
				Global.egg_score = 0
				get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")
		States.FLOUR:
			$Score.text = str(Global.flour_score) + "/75"
			if(!spawned):
				Global.croll_level1_status = 2
				spawn_flour()
			if(Global.flour_score >= 75):
				spawned = false
				$Chef.global_position.x = 64
				$Chef.global_position.y = 288
				state = States.BUTTER
			elif(Global.flour_amount_missed + Global.flour_score == 300):
				spawned = false
				Global.flour_amount_missed = 0
				Global.flour_spawn_x = 1200
				Global.flour_spawn_y = 30
				Global.flour_score = 0
				get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")
		States.BUTTER:
			$Score.text = str(Global.butter_score) + "/1"
			if(!spawned):
				Global.croll_level1_status = 3
				spawn_butter()
			if(Global.butter_score >= 1):
				Global.croll_level1 = true
				get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")
			elif(Global.butter_amount_missed >= 1):
				spawned = false
				Global.butter_amount_missed = 0
				get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")
