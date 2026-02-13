extends CharacterBody2D

func _ready() -> void:
	pass
	
func  _process(delta: float) -> void:
	queue_redraw()
	position.x += delta * 10
	position.y = 100
	pass
	
func _draw() -> void:
	draw_circle(Vector2.ZERO, 60, Color.BLANCHED_ALMOND)
