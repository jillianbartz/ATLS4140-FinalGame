extends Node2D

enum States {EGG, FLOUR, BUTTER}

var state: States = States.EGG

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = States.EGG

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match state:
		States.EGG:
			$Score.text = str(Global.egg_score) + "/2"
			if(Global.egg_score >= 2):
				state = States.FLOUR
		States.FLOUR:
			$Score.text = str(Global.flour_score) + "/20"
			if(Global.egg_score >= 20):
				state = States.BUTTER
		States.BUTTER:
			$Score.text = str(Global.flour_score) + "/5"
			if(Global.egg_score >= 5):
				print("finished scene")
