extends Node2D

enum States {PROJECTILES, CLICK}

var state: States = States.PROJECTILES

var dough = preload("res://cinnamon-roll-round2/dough.tscn")
var new_dough = null

var projectile_start = false
var click_start = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	state = States.PROJECTILES
	new_dough = dough.instantiate()
	add_child(new_dough)
	$Chef/Block.visible = false

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
	match state:
		States.PROJECTILES:
			if(!projectile_start):
				throw_projectiles()
		States.CLICK:
			if(!click_start):
				print("got here")
				clicks()

func _on_block_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
