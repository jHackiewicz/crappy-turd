extends Camera2D

var shake_amount := 0.0
var shake_decay := 5.0
var shake_strength := 10.0  

func _process(delta):
	if shake_amount > 0:
		shake_amount = max(shake_amount - shake_decay * delta, 0)
		offset = Vector2(
			randf_range(-1, 1),
			randf_range(-1, 1)
		) * shake_amount * shake_strength
	else:
		offset = Vector2.ZERO

func trigger_shake(intensity := 1.0):
	shake_amount = intensity
