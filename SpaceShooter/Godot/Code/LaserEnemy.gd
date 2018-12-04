extends "res://Code/Laser.gd"

# PlayerLaser
var laserDamage = 10

func _ready():
	set_bulletSpeed(100)
	set_direction("DOWN")
	$AnimatedSprite.play("red")

func _on_Laser_body_entered(body):
	if "Player" in body.name:
		body.shot(laserDamage)
		queue_free()