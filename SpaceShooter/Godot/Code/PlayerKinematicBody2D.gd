extends KinematicBody2D

const LASER = preload("res://Scenes/Lasers/LaserPlayer.tscn")

var speed = 600
var velocity = Vector2()
var use_slide = true
var health = 100

func get_input():
	velocity = Vector2()
	
	
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed("ui_accept"):
		var laser = LASER.instance()
		get_parent().add_child(laser)
		laser.place($Gun.global_position)

func start(pos):
	position = pos

func take_damage(damage):
	health -= damage
	$Health.text = str("Health: ", health)

func hit():
	take_damage(20)
	
func shot(damage):
	take_damage(damage)

func _physics_process(delta):
	
	get_input()
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			hit()
	
	if health <= 0:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")

#func get_input():
#	velocity = Vector2()
#	if Input.is_action_pressed('ui_right'):
#		velocity.x += 1
#	if Input.is_action_pressed('ui_left'):
#		velocity.x -= 1
#	if Input.is_action_pressed('ui_down'):
#		velocity.y += 1
#	if Input.is_action_pressed('ui_up'):
#		velocity.y -= 1
#	velocity = velocity.normalized() * speed
#
#	if Input.is_action_just_pressed("ui_accept"):
#		var laser = LASER.instance()
#		laser.set_type("PLAYER")
#		get_parent().add_child(laser)
#		laser.place($Gun.global_position)