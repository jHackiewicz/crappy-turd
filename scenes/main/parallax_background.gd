extends ParallaxBackground

@export var scroll_speed: float = 200.0
@onready var player = get_node("../Player")

var is_scrolling: bool = true
func _process(delta: float) -> void:
	if player.is_started and is_scrolling:
		scroll_offset.x -= scroll_speed * delta

func stop_scroll() -> void:
	is_scrolling = false
