extends Node2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	queue_redraw()
	pass
	
func  _draw() -> void:
	draw_line(Vector2(10, 10), Vector2(100, 100), Color.CYAN, 10)
	draw_circle(Vector2(50, 50), 100, Color.BLANCHED_ALMOND, false, 10)
	draw_ellipse(Vector2(100, 200), 200, 50, Color.BLUE, true)
	draw_rect(Rect2(150, 90, 10, 100), Color.from_hsv(0.5, 1, 1, 0.5), false, 10)
	
	var pos = get_viewport().get_mouse_position()
	draw_line(Vector2(0, 0), pos, Color.CYAN, 10)
	
	var rect = get_viewport_rect()
	print(rect.size.x)
	print(rect.size.y)
	
	var c = (pos.x / rect.size.x)
	var halfW = rect.size.x / 2
	draw_circle(Vector2(rect.size.x / 2, rect.size.y / 2), 100, Color.from_hsv(c, 1, 1) )
	if pos.x < halfW:
		draw_rect(Rect2(0, 0, halfW, rect.size.y), Color.DEEP_SKY_BLUE)
	else:
		draw_rect(Rect2(halfW, 0, halfW, rect.size.y), Color.DEEP_SKY_BLUE)
	print(pos)
