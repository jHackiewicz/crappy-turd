extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var ground: Ground = $Ground
@onready var ui: UI = $UI

var score:int

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


func _on_spawner_on_player_scored() -> void:
	score += 1
	ui.update_score(score)
