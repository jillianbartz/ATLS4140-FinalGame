extends Node2D

var up1: bool = true
var up2: bool = true
var up3: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(.05)
	$Area2D3.rotation = deg_to_rad(-12)

func _process(delta: float) -> void:
	$Area2D.global_position.x -= .8
	$Area2D2.global_position.x -= .8
	$Area2D3.global_position.x -= .8
	$Butter.global_position.x -= .8

func area1_rotation():
	if(up1):
		if($Area2D.rotation >= deg_to_rad(15)):
			up1 = false
		$Area2D.rotation += deg_to_rad(1)
	else:
		if($Area2D.rotation <= deg_to_rad(-15)):
			up1 = true
		$Area2D.rotation -= deg_to_rad(1)

func area2_rotation():
	if(up2):
		if($Area2D2.rotation >= deg_to_rad(30)):
			up2 = false
		$Area2D2.rotation += deg_to_rad(2.5)
	else:
		if($Area2D2.rotation <= deg_to_rad(-30)):
			up2 = true
		$Area2D2.rotation -= deg_to_rad(2.5)

func area3_rotation():
	if(up3):
		if($Area2D3.rotation >= deg_to_rad(10)):
			up3 = false
		$Area2D3.rotation += deg_to_rad(1.3)
	else:
		if($Area2D3.rotation <= deg_to_rad(-10)):
			up3 = true
		$Area2D3.rotation -= deg_to_rad(1.3)

func _on_timer_timeout() -> void:
	area1_rotation()
	area2_rotation()
	area3_rotation()
	$Timer.start(.05)


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("restart!")


func _on_butter_body_entered(body: Node2D) -> void:
	Global.butter_score = 1
	print("game end")
