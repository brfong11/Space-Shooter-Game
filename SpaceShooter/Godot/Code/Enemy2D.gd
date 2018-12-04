extends KinematicBody2D


export (int) var speed

var velocity = Vector2()
var is_dead = false
var health = 50

const LASER = preload("res://Scenes/Lasers/LaserEnemy.tscn")

func _ready():
	velocity.y += speed
	pass

func die():
	get_parent().kill_counter()
	queue_free()

func _physics_process(delta):

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			die()
	
func shot(damage):
	
	health -= damage
	if health <= 0:
		velocity = Vector2 (0,0)
		die()
	
func hit():
	die()
	
	

func _on_ShootingTimer_timeout():
	var laser = LASER.instance()
	get_parent().add_child(laser)
	laser.place($gun.global_position)
