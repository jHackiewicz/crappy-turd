extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var ground: Ground = $Ground

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	ground.start_scroll()
	


func _on_spawner_on_obstacle_crash() -> void:
	player.stop_movement()
	$ParallaxBackground.stop_scroll()
	$Ground.stop_scroll()
	


func _on_ground_on_player_crashed() -> void:
	spawner.stop_obstacles()
	$ParallaxBackground.stop_scroll()
