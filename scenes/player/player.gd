extends CharacterBody2D
class_name Player 

signal on_game_started
@onready var sprite = $Sprite2D
@export var gravity: float = 1200
@export var jump_force: float = -600
@export var max_speed: float = 400
@export var rotation_speed: float = 2

@onready var jump_sound: AudioStreamPlayer = $JumpSound
@onready var background_music: AudioStreamPlayer = $BackgroundMusic


var is_started: bool = false
var should_process_input: bool = true
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and should_process_input:
		velocity.y = jump_force
		rotation = deg_to_rad(-30)
		jump_sound.play()
		if not is_started:
			is_started = true
			on_game_started.emit()
			background_music.play()
			
			
	if not is_started:
		return
	#Apply gravity
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, max_speed)
	# Check for jump input
	
	if should_process_input and not sprite.is_playing():
		sprite.play("flying green turd")
	#Move the player
	move_and_slide()
	
	#rotate the player when falling 
	rotate_player(delta)
	
func rotate_player(delta: float) -> void:
	if velocity.y > 0 and rotation < deg_to_rad(90):
		rotation += rotation_speed * delta
	
func stop_movement() -> void:
		should_process_input = false
		sprite.stop()
		
func stop_gravity() -> void:
		gravity = 0
		velocity = Vector2.ZERO

func stop_music() -> void:
	background_music.stop()
