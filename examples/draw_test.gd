extends Node2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	queue_redraw()
	var x = get_viewport().get_mouse_position().x
	var s = get_viewport_rect().size
	
	var f = (x / s.x) * 15000
	f = remap(x, 0, s.x, 50, 10000)
	
	var ff = Input.get_axis("left", "right")
	print(ff)
	
	$Node.set_frequency(f)
	# $Node.set_amplitude()
	
	
func draw_grid():
	var num_circles = 10
	var s = get_viewport_rect().size
	var w = s.x / num_circles
	var r = w / 2
	
	for row in range(num_circles):	
		for col in range(num_circles):
			var x = r + w * col
			var y = r + w * row
			var hue = (col + row) / float(num_circles * 2)
			draw_circle(Vector2(x, y), r, Color.from_hsv(hue, 1, 1))
		
	
func _draw():
	draw_grid()
	#var p = get_viewport().get_mouse_position()
	#var num_bars:int = p.x / 10.0
	#
	#var s = get_viewport_rect().size
	#var w = s.x / num_bars
	#
	#for i in range(num_bars):
		#var x = i * w
		#var hue = i / float(num_bars)
		#draw_rect(Rect2(x, 0, w, s.y), Color.from_hsv(hue, 1, 1), true)
	pass
	
