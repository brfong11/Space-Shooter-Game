extends Sprite

export var velocity = Vector2()
var screenSize = get_viewport_rect().size

func _ready():
	pass

func _process(delta):
	translate(velocity * delta)

func _on_VisibilityNotifier2D_screen_exited():
	position.y = -240

