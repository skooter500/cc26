extends Node2D

var num_points = 100
	
func _ready() -> void:
	num_points = int($"../Label2".text)
	$"../num_points".value = num_points
	pass
	
func draw_star():
	var r = 100
	
	var theta_inc = PI * 2.0 / float(num_points * 2)
	
	for i in range(num_points * 2):
		if i % 2 == 0:
			r = 100
		else:
			r = 200
		var theta = i * theta_inc
		var x = cos(theta) * r
		var y = sin(theta) * r
		if i % 2 == 0:
			r = 200
		else:
			r = 100
		var theta1 = (i + 1) * theta_inc
		var x1 = cos(theta1) * r
		var y1 = sin(theta1) * r
		
		var c = Color.from_hsv($"../VSlider".value, 1, 1, 0.7)
		# draw_circle(Vector2(x, y), 10, c)
		draw_line(Vector2(x, y), Vector2(x1, y1), c, 10)

var num_arms = 20

func draw_spiral():
	var r = 5
		
	var theta = 0
	var theta_inc = 2.0 * PI / float(num_points)
	for j in range(num_arms):	
		
		for i in range(num_points):			
			theta += theta_inc			
			var x = cos(theta) * r
			var y = sin(theta) * r
			r += 10
			var theta1 = theta + theta_inc
			var x1 = cos(theta1) * r
			var y1 = sin(theta1) * r
			
			var c = Color.from_hsv($"../VSlider".value, 1, 1, 0.7)
			# draw_circle(Vector2(x, y), 10, c)
			draw_line(Vector2(x, y), Vector2(x1, y1), c, 10)
			
func _draw() -> void:
	draw_spiral()
	pass
	
func _process(delta: float) -> void:
	num_points = $"../num_points".value
	$"../Label2".text = str(int(num_points))
	queue_redraw()
	pass
