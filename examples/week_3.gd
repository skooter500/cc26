extends Node2D


var block_scene =  preload("res://examples/box.tscn")

func _on_button_pressed() -> void:
	var vr:Rect2 = get_viewport_rect()
	$AudioStreamPlayer.pitch_scale = randf_range(0.5, 1.5)
	$AudioStreamPlayer.play()
	var c:int = int($create_count.text)
	for i in range(c):
		var block = block_scene.instantiate()
		block.get_node("Sprite2D").modulate = Color.from_hsv(randf_range(0, 1), 1, 1)
		add_child(block)
		# vr.size.x = width
		# vr.size.y = height
		block.position.x = randf_range(0, vr.size.x)
	
	print("Button pressed!")
	pass # Replace with function body.

func _process(delta: float) -> void:
	$background_musi.pitch_scale = $HSlider.value
