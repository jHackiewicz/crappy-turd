extends ParallaxBackground

@export var scroll_speed: float = 200.0
@onready var player = get_node("../Player")

func _process(delta: float) -> void:
	if player.is_started:
		scroll_offset.x -= scroll_speed * delta
