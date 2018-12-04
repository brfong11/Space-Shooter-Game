extends KinematicBody2D


export (int) var speed

var velocity = Vector2()
var is_dead = false
var health = 50

const LASER = preload("res://Scenes/Lasers/LaserEnemy.tscn")

func _ready():
	velocity.y += speed
	pass


func _physics_process(delta):

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			queue_free()
	
func shot(damage):
	
	health -= damage
	if health <= 0:
		velocity = Vector2 (0,0)
		queue_free()
	
func hit():
	queue_free()
	
	

func _on_ShootingTimer_timeout():
	var laser = LASER.instance()
	laser.set_type("ENEMY")
	get_parent().add_child(laser)
	laser.place($gun.global_position)
