extends Node2D

var self_instance = preload("res://cinnamon-roll-round2/dough_projectile.tscn")

var pattern: int
var spawned: bool = false
var amt = 0
var changed_position = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pattern = randi_range(0, 2)


func pattern_0():
	await get_tree().create_timer(.3).timeout
	while(amt < 10):
		var new_self = self_instance.instantiate()
		new_self.fire(Vector2(0,changed_position), 400)
		add_child(new_self)
		amt += 1
		changed_position += 65
	Global.shooting = false
	spawned = true
	changed_position = 0

func pattern_1():
	while(amt < 10):
		await get_tree().create_timer(.3).timeout
		var new_self = self_instance.instantiate()
		new_self.fire(Vector2(0,300), 300)
		add_child(new_self)
		amt += 1
	Global.shooting = false
	spawned = true

func pattern_2():
	await get_tree().create_timer(.3).timeout
	while(amt < 20):
		var new_self = self_instance.instantiate()
		new_self.fire(Vector2(0,changed_position), 350)
		add_child(new_self)
		amt += 1
		changed_position += 32.5
	Global.shooting = false
	spawned = true
	changed_position = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match pattern:
		0:
			if(!spawned):
				Global.shooting = true
				pattern_0()
		1:
			if(!spawned):
				Global.shooting = true
				pattern_1()
		2:
			if(!spawned):
				Global.shooting = true
				pattern_2()
