extends Node2D

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		print(event.position.x)
		print(event.position.y)
		$sinwavegenerator.set_frequency(event.position.x * 2)
