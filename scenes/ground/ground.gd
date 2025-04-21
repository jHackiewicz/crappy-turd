extends Node2D
class_name Ground

signal on_player_crashed

@export var speed := -150

@onready var ground_1: Area2D = $Ground_1
@onready var ground_2: Area2D = $Ground_2
@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var game_over_sound: AudioStreamPlayer = $game_over_sound

var width: int
var is_game_started := false

func _ready()->void:
	width = sprite_2d.texture.get_width()
	
func stop_scroll():
	speed = 0
	
func _process(delta: float) -> void:
		if not is_game_started:
			return
			
		ground_1.global_position.x += speed * delta	
		ground_2.global_position.x += speed * delta	
		
		if ground_1.global_position.x < -width / 2:
			ground_1.global_position.x = ground_2.global_position.x + width
			
		if ground_2.global_position.x < -width / 2:
			ground_2.global_position.x = ground_1.global_position.x + width


func start_scroll():
	is_game_started = true
	
func _on_ground_body_entered(body: Node2D) -> void:
	on_player_crashed.emit()
	speed = 0
	game_over_sound.play()
	var player_ref = body as Player
	player_ref.stop_movement()
	player_ref.stop_gravity()
	
	
