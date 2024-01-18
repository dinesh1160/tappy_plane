extends Control

@onready var highscorelabel = $MC/HB/HIGHSCORELABEL

# Called when the node enters the scene tree for the first time.
func _ready():
	highscorelabel.text = str(GameManager._get_highscore())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()
