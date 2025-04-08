extends Node2D

@export var move_speed: float = 150

func _process(delta: float) -> void:
	position.x -= move_speed * delta
