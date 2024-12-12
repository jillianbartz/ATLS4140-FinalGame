extends Node2D

enum States {PROJECTILES, CLICK}

var state: States = States.PROJECTILES

var dough = preload("res://cinnamon-roll-round2/dough.tscn")
var new_dough = null

var projectile_start = false
var click_start = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Chef/ChefSprite/AnimationPlayer.play("Idle")
	state = States.PROJECTILES
	new_dough = dough.instantiate()
	add_child(new_dough)
	$Chef/Block.visible = false
	Global.chef_health = 100

func use_spawner():
	var projectile = load("res://cinnamon-roll-round2/dough_projectile_spawner.gd").new()
	add_child(projectile)

func throw_projectiles():
	projectile_start = true
	for i in range(6):
		$ProjectileTimer.start(randi_range(.5, 5))
		await $ProjectileTimer.timeout 
		use_spawner()
	$ProjectileTimer.start(2)
	await $ProjectileTimer.timeout 
	click_start = false
	state = States.CLICK

func _on_projectile_timer_timeout() -> void:
	print("timeout")

func clicks():
	$ClickTimer.start(10)
	new_dough.can_be_hit = true
	click_start = true

func _on_click_timer_timeout() -> void:
	projectile_start = false
	new_dough.can_be_hit = false
	state = States.PROJECTILES

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Chef/ChefHealth.value = Global.chef_health
	for body in $Chef/Block.get_overlapping_areas():
		if(body.get_collision_layer() == 2 && Input.is_action_just_pressed("Parry")):
			$Chef/Block.visible = true
			$Chef/ChefSprite/AnimationPlayer.play("Parry")
			body.queue_free()
	for areas in $Chef/Hit.get_overlapping_areas():
		Global.chef_health -= .3
	if(Global.attack_anim):
		$Chef/ChefSprite/AnimationPlayer.play("Attack")
		Global.attack_anim = false
	if(Global.dough_health <= 0):
		Global.croll_level2 = true
		get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")
	if(Global.chef_health <= 0):
		$Chef/ChefSprite/AnimationPlayer.play("Death")
	match state:
		States.PROJECTILES:
			if(!projectile_start):
				new_dough.angy = true
				throw_projectiles()
		States.CLICK:
			if(!click_start):
				new_dough.angy = false
				print("got here")
				clicks()

func _on_block_area_entered(area: Area2D) -> void:
	area.get_node("Sprite2D").modulate = Color(245, 39, 145, 1)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$Chef/Block.visible = false
	if(anim_name == "Death"):
		get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")
	$Chef/ChefSprite/AnimationPlayer.play("Idle")
