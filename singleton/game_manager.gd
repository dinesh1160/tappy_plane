extends Node

signal on_game_over
signal on_score_updated

const GROUP_PLANE: String = "plane"

var game_scene: PackedScene = preload("res://game/game.tscn")
var main_scene: PackedScene = preload("res://main/main.tscn")

var _score: int = 0
var _highscore: int = 0

func _get_score() -> int:
	return _score 
	
func _get_highscore() -> int:
	return _highscore
	
func set_score(v:int) -> void:
	_score = v
	if _score > _highscore:
		_highscore = _score
	on_score_updated.emit()
	print("sc:%s Hsc:%s" % [_score, _highscore])
	
func increment_score() -> void:
	set_score(_score+1)
	
func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)
