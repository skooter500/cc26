extends CharacterBody2D

var speed:float = 100
var rot_speed:float = 90

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	$"../text_label".text = "Transform.x: " + str(transform.x) + "\n" + "Transform.y: " + str(transform.y)
	var f = Input.get_axis("forwards", "backwards")
	# print(f)
	# translate(transform.y * f * speed * delta)
	position += transform.y * f * speed * delta
	
	var r = Input.get_axis("left", "right")
	rotation += r * rot_speed * delta
	pass
