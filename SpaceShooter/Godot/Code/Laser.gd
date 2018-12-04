extends Area2D

var bulletSpeed = int(1000)
var velocity
var direction = -1
var kind

func set_bulletSpeed(speed):
	bulletSpeed = int(speed)
	
func set_direction(inputtedDirection):
	if inputtedDirection == "DOWN":
		direction = 1
	elif inputtedDirection == "UP":
		direction = -1

func _ready():
	pass

func place(pos):
	position = pos

func _process(delta):
	var velocity = Vector2()
	velocity.y = int(direction * bulletSpeed)
	
	position += velocity * delta


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
