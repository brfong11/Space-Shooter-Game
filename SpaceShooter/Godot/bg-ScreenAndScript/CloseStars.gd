extends ParallaxLayer

export (int) var backroundSpeed

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	motion_offset.y += backroundSpeed
