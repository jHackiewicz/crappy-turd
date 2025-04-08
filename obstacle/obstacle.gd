extends Node2D
class_name Player

signal on_turd_crash

@export var move_speed: float = 150

func _process(delta: float) -> void:
	position.x -= move_speed * delta


func _on_top_body_entered(body: Node2D) -> void:
	if not body is Player: return
	on_turd_crash.emit()
	print("This works! Top Collision")


func _on_bottom_body_entered(body: Node2D) -> void:
	if not body is Player: return
	on_turd_crash.emit()
	print("This works! Bottom Collision")
