extends Node2D

@export var pipes_scene: PackedScene


@onready var pipesholder = $pipesholder
@onready var spawn_u = $spawnU
@onready var spawn_l = $spawnL
@onready var spawntimer = $spawnTimer
@onready var enginesound = $ENGINESOUND
@onready var gameoversound = $GAMEOVERSOUND


func _ready():
	GameManager.set_score(0)
	GameManager.on_game_over.connect(on_game_over)
	spawn_pipes()  
 
func _process(delta):
	pass
	
func spawn_pipes() -> void:
	var ypos = randf_range(spawn_u.position.y,spawn_l.position.y)
	var new_pipes = pipes_scene.instantiate()
	
	new_pipes.position = Vector2(spawn_l.position.x,ypos)
	pipesholder.add_child(new_pipes)
	
func stop_pipes() -> void:
	spawntimer.stop()
	for pipes in pipesholder.get_children():
		pipes.set_process(false)
	


func _on_spawn_timer_timeout():
	spawn_pipes() 


func on_game_over():
	stop_pipes() 
	enginesound.stop()
	gameoversound.play()
	
	
	
