extends Node2D

const SAVEFILE: String = "user://score.save"

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var ground: Ground = $Ground
@onready var ui: UI = $UI

var score:int
var high_score: int

func _ready() -> void:
	load_highscore()
	
func load_highscore() -> void:
	var file: FileAccess = FileAccess.open(SAVEFILE, FileAccess.READ)
	if file:
		high_score = file.get_32()
		
func save_score() -> void:
	if score > high_score:
		high_score = score
		var file: FileAccess = FileAccess.open(SAVEFILE, FileAccess.WRITE)
		file.store_32(high_score)
		
func _on_player_on_game_started() -> void:
	spawner.timer.start()
	ui.start_menu.hide()
	ground.start_scroll()
	


func _on_spawner_on_obstacle_crash() -> void:
	player.stop_movement()
	$ParallaxBackground.stop_scroll()
	$Ground.stop_scroll()
	


func _on_ground_on_player_crashed() -> void:
	spawner.stop_obstacles()
	$ParallaxBackground.stop_scroll()
	load_highscore()
	ui.game_over()
	ui.calculate_score(score, high_score)


func _on_spawner_on_player_scored() -> void:
	score += 1
	ui.update_score(score)
	save_score()
