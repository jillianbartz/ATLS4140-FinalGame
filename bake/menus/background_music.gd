extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BG.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.achievement):
		$Achievement.play()
		Global.achievement = false
	if(Global.dough_music):
		$BG.stop()
		$DoughFight.play()
	else:
		if($DoughFight.playing):
			$DoughFight.stop()
			$BG.play()
