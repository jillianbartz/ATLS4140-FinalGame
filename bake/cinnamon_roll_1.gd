extends Node2D

enum States {EGG, FLOUR, BUTTER}

var state: States = States.EGG

var egg = preload("res://egg.tscn")
var flour = preload("res://flour.tscn")
var butter = preload("res://butter.tscn")

var spawned: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = States.EGG

func spawn_eggs():
	var egg_duplicates = 0
	while(egg_duplicates < 7):
		var new_egg = egg.instantiate()
		add_child(new_egg)
		egg_duplicates += 1
	spawned = true

func spawn_flour():
	var flour_duplicates = 0
	while(flour_duplicates < 50):
		var new_flour = flour.instantiate()
		add_child(new_flour)
		flour_duplicates += 1
	spawned = true

func spawn_butter():
	var new_butter = butter.instantiate()
	add_child(new_butter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match state:
		States.EGG:
			$Score.text = str(Global.egg_score) + "/2"
			if(!spawned):
				spawn_eggs()
			if(Global.egg_score >= 2):
				spawned = false
				state = States.FLOUR
		States.FLOUR:
			$Score.text = str(Global.flour_score) + "/20"
			if(!spawned):
				spawn_flour()
			if(Global.flour_score >= 20):
				spawned = false
				state = States.BUTTER
		States.BUTTER:
			$Score.text = str(Global.butter_score) + "/5"
			if(!spawned):
				spawn_butter()
			if(Global.butter_score >= 5):
				print("finished scene")
