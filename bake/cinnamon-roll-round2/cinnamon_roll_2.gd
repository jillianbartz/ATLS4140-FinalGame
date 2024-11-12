extends Node2D

enum States {PROJECTILES, CLICK}

var state: States = States.PROJECTILES

var dough = preload("res://cinnamon-roll-round2/dough.tscn")
var dough_health = 100

var projectile_start = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	state = States.PROJECTILES
	var new_dough = dough.instantiate()
	add_child(new_dough)
	dough_health = 100
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
	state = States.CLICK

func _on_projectile_timer_timeout() -> void:
	print("timeout")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match state:
		States.PROJECTILES:
			if(!projectile_start):
				throw_projectiles()
		States.CLICK:
			print("click")
