extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BG.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.achievement):
		$Achievement.play()
		Global.achievement = false
	if(Global.dough_music && !$DoughFight.playing):
		$BG.stop()
		$DoughFight.volume_db = 0
		$DoughFight.play()
	elif(!Global.dough_music):
		if($DoughFight.playing):
			$DoughFight.stop()
			$BG.play()
